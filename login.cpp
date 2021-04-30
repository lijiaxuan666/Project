#include<stdio.h> 
#include<stdlib.h>
#include<string.h>
#include<conio.h>
#include<windows.h>
void color(short x)	
{
	if (x >= 0 && x <= 15)//参数在0-15的范围颜色
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), x);	//只有一个参数，改变字体颜色 
	else//默认的颜色白色
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
}

void goto_xy(int x, int y)
{
	HANDLE hOut;
	hOut = GetStdHandle(STD_OUTPUT_HANDLE);
	COORD pos = { x,y };
	SetConsoleCursorPosition(hOut, pos);
}
int main(){
	printf("登录系统") ;
	char usename[20],password[20],original_usename[20],original_password[20],ch;
	FILE *fp;
	if((fp=fopen("user.txt","r"))==NULL){
		printf("打开文件失败!\n");
		exit(1);
	}
	printf("\n\n\n                             登录\n"); 
	printf("\n                         用户名："); 
	scanf("%s",usename);
	printf("\n                         密码："); 
	
	int x=0;
	while(password[x]=getch()){
 		if(password[x]=='\r')
		 	break;
        putchar('*');
        x++;
	}
	password[x]='\0';
	
	printf("\n");
	fscanf(fp,"%s",original_usename);
	fscanf(fp,"%s",original_password);
	if(strcmp(usename,original_usename)==0&&strcmp(password,original_password)==0)
		printf("\n匹配成功！\n");
	else
		printf("\n用户名或密码错误\n");
	fclose(fp);
	return 0;
}
