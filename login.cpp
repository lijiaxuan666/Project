#include<stdio.h> 
#include<stdlib.h>
#include<string.h>
#include<conio.h>
int main(){
	char usename[20],password[20],original_usename[20],original_password[20],ch;
	FILE *fp;
	if((fp=fopen("1.txt","r"))==NULL){
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
