@echo off
set BBDown=".\BBDown.exe"
set ffmpeg=".\ffmpeg.exe"

echo BBDOWN���ؽű�
echo made by Tensin
setlocal enabledelayedexpansion
IF EXIST "BBDown.data" (
    set /p url=��������Ƶbv�Ż�av��:
	echo 1.Ĭ��
	echo 2.��������Ƶ
	echo 3.��������Ƶ
	echo 4.��������Ļ
	echo 5.����ʽѡ��������
	echo 6.Hires��Դ���أ�by��DRV��
    set /p opt=Optionsѡ�񣨴����֣�:
	echo ��������...
	IF !opt!==1 (%BBDown% !url!)
	IF !opt!==2 (%BBDown% --video-only !url!)
	IF !opt!==3 (%BBDown% --audio-only !url!)
	IF !opt!==4 (%BBDown% --sub-only !url!)
	IF !opt!==5 (%BBDown% -ia !url!)
	IF !opt!==6 (%BBDown% --audio-only !url!
    	echo ��Դ�������
    	echo ���ڷ�װFLAC�ļ�...
   		for %%a in (*.m4a) do (
    	    %ffmpeg% -i "%%~na.m4a" -c copy "%%~na.flac"
 	   )
 	    echo ��װ���
 	    echo ����ɾ��m4a�ļ�...
 	    del *.m4a)
echo �������
) ELSE (
    echo ����û�е�¼
    echo ��ɨ���ά���Ե�½����Bվ�˺�
    %BBDown% login
    echo ��½���,��رղ��������б��ű�
)
pause