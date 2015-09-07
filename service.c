#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include "sys/socket.h"
#include "arpa/inet.h"
#include <opencv/highgui.h>
#include <opencv/cv.h>
#include <stdio.h>  
#include <stdlib.h> 
#include <string.h>

#define RCV_BUF_LEN 2000

int bufferPro(char recvBuf[], int nPos[])
{
	const char * split = "-"; 
    	char * p; 
    	int i = 0;

   	p = strtok (recvBuf,split); 

   	while(p!=NULL) 
    	{ 
       		   //printf ("%s\n",p); 
        	  	nPos[i] = atoi(p); i++;
        	  	p = strtok(NULL,split); 
    	} 	

    	return 0;
}

int imageProc(int nPos[])
{
	IplImage *src = NULL;
         	IplImage* mask = NULL;
         	static int pp = 0;

          	src = cvLoadImage("warehouse.jpg", -1);
          	mask = cvLoadImage("forklift.jpg", -1);
          	if (src == NULL || mask ==NULL)
          	{
               	return -1;
          	}
          	IplImage* pSrc = cvCloneImage(src);
     
          	CvRect iRect = cvRect(nPos[0],nPos[1],mask->width,mask->height);
          	cvSetImageROI(pSrc,iRect);
          	cvCopyImage(mask,pSrc);
          	cvResetImageROI(pSrc);

          	cvAddWeighted(pSrc,0.9,src,0.1,0.0,src);

          	//cvShowImage("Image_show", pSrc);
          	if (pp == 0)
          	{
          		cvSaveImage("after.jpg", pSrc, 0);
          		cvSaveImage("after1.jpg", pSrc, 0);
          		pp = 1;
          	}
          	else
          	{
          		cvSaveImage("after.jpg", pSrc, 0);
          		cvSaveImage("after1.jpg", pSrc, 0);
          		pp = 0;
          	}

          	//cvWaitKey(0);
          	cvReleaseImage(&pSrc);

    	return 0;
}

int main(int argc, char **argv)
{
	int sock;
	int client_sock;
	int ret;
	char inputBuf[RCV_BUF_LEN];
	char recvBuf[RCV_BUF_LEN];
	struct sockaddr_in svrAddr;
	int i;
	int val;
	int nPos[2];
	static int count = 0;

	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0)
	{
		printf("socket is error! \n");
		return -1;
	}

	memset(&svrAddr, 0x00, sizeof(svrAddr));
	svrAddr.sin_family = AF_INET;
	svrAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	svrAddr.sin_port = htons(3001);
	setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (char *)&val, sizeof(val));

	if (bind(sock, (struct sockaddr *)&svrAddr, sizeof(svrAddr)) != 0)
	{
		printf("bind error ! \n");
		return -1;
	}

	if (listen(sock, 10) != 0)
	{
		printf("listen error !\n");
		return -1;
	}

	while (1)
	{
		printf("waitting for client connect request: \n");
		if ( (client_sock = accept( sock, NULL, 0 )) < 0 )
		{
			printf("accept error!\n");
            			return -1;
        		}

        		printf("client is connected!\n");
        		while (1)
        		{
        			memset(recvBuf, 0x00, RCV_BUF_LEN);
        			ret = recv(client_sock, recvBuf, RCV_BUF_LEN, 0);
        			recvBuf[strlen(recvBuf) - 1] = 0;
        			if (ret > 0)
        			{
        				printf("RECV: [%s] count %d\n", recvBuf, count);
        				count++;
        				bufferPro(recvBuf, nPos);
        				printf("%d : ", nPos[0]);
          				printf("%d\n", nPos[1]);
        				imageProc(nPos);
        				ret = send(client_sock, recvBuf, strlen(recvBuf), 0);
        				if (ret > 0)
        				{
        					printf("recv and send ok!\n");
        				}
        				else if (ret < 0)
        				{
        					printf("send to client error\n");
        				}	

        				//bufferPro(recvBuf, nPos);
        				//printf("%d : ", nPos[0]);
          				//printf("%d\n", nPos[1]);
        				//imageProc(nPos);

        			}
        			else if (ret == 0)
        			{
        				printf("client is disconnect!\n");
        				break;
        			}
        			else
        			{
        				printf("ercv error!\n");
        				break;
        			}
       		}
	}

	return 0;
}





