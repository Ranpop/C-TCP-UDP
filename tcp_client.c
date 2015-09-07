#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "shMem.h"

#define FT2M 0.3048
#define TINDEX 2
#define TESTDATA

struct makerdata
{
	double posX;
             double posY;
};


int readMakerData(struct makerdata *temp)
{
#ifdef TESTDATA
	struct makerdata test[4] = {{20,20}, {50, 50}, {100, 100}, {200, 200}};
	static count = 0;

	if (4 == count)
	{
		count = 0;
	}
	temp->posX = test[count].posX;
	temp->posY = test[count].posY;
	count++;
	printf("read Ok x=%f, y=%f\n", temp->posX, temp->posY);

	return 0;
#else
	if (NULL == shared)
	{
		return -1;
	}

	temp.posX = (shared->sharedMarker[TINDEX].posX)*FT2M;
	temp.posY = (shared->sharedMarker[TINDEX].posY)*FT2M;
	printf("read Ok x=%f, y=%f\n", temp.posX, temp.posY);

	return 0;
#endif
}

int main(int argc, char *argv[])
{
	int client_sockfd;
	int len;
	struct sockaddr_in remote_addr; //服务器端网络地址结构体
	char buf[BUFSIZ];  //数据传送的缓冲区
	struct makerdata mktemp;
	memset(&remote_addr,0,sizeof(remote_addr)); //数据初始化--清零
	remote_addr.sin_family=AF_INET; //设置为IP通信
	remote_addr.sin_addr.s_addr=inet_addr("192.168.6.150");//服务器IP地址
	remote_addr.sin_port=htons(3001); //服务器端口号
	printf("start to connect server\n");
	/*创建客户端套接字--IPv4协议，面向连接通信，TCP协议*/
	if((client_sockfd=socket(PF_INET,SOCK_STREAM,0))<0)
	{
		perror("socket");
		return 1;
	}
	
	/*将套接字绑定到服务器的网络地址上*/
	if(connect(client_sockfd,(struct sockaddr *)&remote_addr,sizeof(struct sockaddr))<0)
	{
		perror("connect");
		return 1;
	}
	printf("connected to server\n");
	len=recv(client_sockfd,buf,BUFSIZ,0);//接收服务器端信息
        	buf[len]='/0';
	printf("server buf %s\n",buf); //打印服务器端信息
	memset(&mktemp, 0, sizeof(mktemp));
	/*循环的发送接收信息并打印接收信息--recv返回接收到的字节数，send返回发送的字节数*/
	while(1)
	{
		if (0 == readMakerData(&mktemp))
		{
			//memcpy(buf, &mktemp, sizeof(mktemp));
			char xtemp[10], ytemp[10], flag[11]="-";
			gcvt(mktemp.posX,6,buf);
			gcvt(mktemp.posY,6,ytemp);
			strcat(flag, ytemp);
			strcat(buf, flag);
			//printf("read Ok x=%f, y=%f\n", mktemp.posX, mktemp.posY);
		}
		else
		{
			continue;
		}
		//printf("Enter string to send:");
		//scanf("%s",buf);
		printf("Send data is :%s\n", buf);
		if(!strcmp(buf, "quit"))
		{
			break;
		}
		len = send(client_sockfd, buf, strlen(buf),0);
		len = recv(client_sockfd, buf, BUFSIZ, 0);
		buf[len] = '/0';
		printf("received:%s\n", buf);
	}
	close(client_sockfd);//关闭套接字
         return 0;
}
