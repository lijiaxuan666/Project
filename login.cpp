#include<stdio.h> 
#include<stdlib.h>
#include<string.h>
#include<conio.h>
#include<windows.h>
void color(short x)	
{
	if (x >= 0 && x <= 15)//������0-15�ķ�Χ��ɫ
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), x);	//ֻ��һ���������ı�������ɫ 
	else//Ĭ�ϵ���ɫ��ɫ
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
	printf("��¼ϵͳ") ;
	char usename[20],password[20],original_usename[20],original_password[20],ch;
	FILE *fp;
	if((fp=fopen("user.txt","r"))==NULL){
		printf("���ļ�ʧ��!\n");
		exit(1);
	}
	printf("\n\n\n                             ��¼\n"); 
	printf("\n                         �û�����"); 
	scanf("%s",usename);
	printf("\n                         ���룺"); 
	
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
		printf("\nƥ��ɹ���\n");
	else
		printf("\n�û������������\n");
	fclose(fp);
	return 0;
}
