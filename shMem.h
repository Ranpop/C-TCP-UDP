/*
 * Copyright (C) 2015 vvme
 *
 * author   : Joseph Chen
 * e-mail   : chencunzhu@163.com
 * home page: 
 */
/*
 * shMem.h *
 * Created on: 2015-2-26
 * Author: Joseph Chen
 */

#ifndef SHMEM_H_
#define SHMEM_H_

#include <sys/shm.h>

#define TEXT_SZ 4043040//5043040//6043040//1543040//8192000  
#define CAM_COUNT 3
#define CMD_SZ 20
#define BRACKET_MAX_CT 10

struct shared_img_st {
        int written; // 作为一个标志，0x1111表示可读，0x00可写: 
		     // 0x1000 text2 for marker
                     // 0x0100 text for marker
		     // 0x0010 text2 for line
 		     // 0x0001 text for line  
        int64_t size;
        int32_t nWidth;              
        int32_t nHeight;            
        int32_t nPixelFormat;
        unsigned char text[TEXT_SZ]; // 写入和读取  
        unsigned char text2[TEXT_SZ];
        int index;
};

struct shared_marker_st {
        int written;
        double posX;
        double posY;
};

struct shared_subcmd_st {
	char cmdType; //"d", "t","f","N";
	double pos;
	double posX;
	double posY;
};

struct shared_command_st {
	int written;
	struct shared_subcmd_st subcmd[CMD_SZ];
};

struct shared_line_st {
        int written;
        double angle;
        double distance;
};

struct shared_bracket_st {
        int written;
        double posX[BRACKET_MAX_CT];
        double posY[BRACKET_MAX_CT];
        double posZ[BRACKET_MAX_CT];
	double angleX[BRACKET_MAX_CT];
	double angleZ[BRACKET_MAX_CT];
};

struct shared_obstacle_st {
        int written;
        double posX;
        double posY;
        double posZ;
};

struct shared_forklift_state_st {
        double X0; // 车尾x坐标
        double Y0; // 车尾y坐标
        double wheelAngle; // 轮转向角
        double rightWheelAngle;
        double leftWheelAngle;
        double headingAngle; // 车身航向角
        double forkliftLength; // 车长度
        double forkliftWidthHead; 
        double forkliftWidthTail;
        double v; // 车速
        double wTurnWheel;
        double lineDistance;
        int orientation; // -1, fork point to -x; 1, fork point to +x; -2, fork point to -y; 2, fork point to +y. 
};

struct shared_use_st {
        struct shared_img_st sharedImg[CAM_COUNT];
        struct shared_marker_st sharedMarker[CAM_COUNT];
        struct shared_line_st sharedLine[CAM_COUNT];
        struct shared_bracket_st sharedBracket;
        struct shared_obstacle_st sharedObstacle;
        struct shared_command_st sharedCmd;
	struct shared_forklift_state_st sharedForkliftState;
};

void *shm = NULL;
struct shared_use_st *shared = NULL;
int shmid = -1;

void initShMem(void) {
        // 创建共享内存  
        shmid = shmget((key_t)1234, sizeof(struct shared_use_st), 0666|IPC_CREAT);
        if(shmid == -1) {
                fprintf(stderr, "shmget failed\n");
                exit(1);//EXIT_FAILURE
        }

        // 将共享内存连接到当前进程的地址空间  
        shm = shmat(shmid, (void*)0, 0);
        if(shm == (void*)-1) {
                fprintf(stderr, "shmat failed\n");
                exit(1);
        }
        //printf("Memory attached at %X\n", (int)shm);
        // 设置共享内存  
        shared = (struct shared_use_st*)shm;
}

void releaseShMem(void) {
        // 释放buffer
        if(shm) {
                if (shmdt(shm) == -1) {
                        fprintf(stderr, "shmdt failed\n");
                        exit(1);
                }
                shm = NULL;
                shared = NULL;
        }
}

void deleteShMem(void) {
	// 删除共享内存  
        if(shmid > 0) {
                if (shmctl(shmid, IPC_RMID, 0) == -1) {
                        fprintf(stderr, "shmctl(IPC_RMID) failed\n");
                        exit(1);
                }
		shmid = -1;
	}
}
                   
#endif /* SHMEM_H_ */

