@echo off
set BBDown=".\BBDown.exe"
set ffmpeg=".\ffmpeg.exe"

echo BBDOWN下载脚本
echo made by Tensin
setlocal enabledelayedexpansion
IF EXIST "BBDown.data" (
    set /p url=请输入视频bv号或av号:
	echo 1.默认
	echo 2.仅下载视频
	echo 3.仅下载音频
	echo 4.仅下载字幕
	echo 5.交互式选择清晰度
	echo 6.Hires资源下载（by：DRV）
    set /p opt=Options选择（纯数字）:
	echo 正在下载...
	IF !opt!==1 (%BBDown% !url!)
	IF !opt!==2 (%BBDown% --video-only !url!)
	IF !opt!==3 (%BBDown% --audio-only !url!)
	IF !opt!==4 (%BBDown% --sub-only !url!)
	IF !opt!==5 (%BBDown% -ia !url!)
	IF !opt!==6 (%BBDown% --audio-only !url!
    	echo 资源下载完成
    	echo 正在封装FLAC文件...
   		for %%a in (*.m4a) do (
    	    %ffmpeg% -i "%%~na.m4a" -c copy "%%~na.flac"
 	   )
 	    echo 封装完成
 	    echo 正在删除m4a文件...
 	    del *.m4a)
echo 下载完成
) ELSE (
    echo 您还没有登录
    echo 请扫描二维码以登陆您的B站账号
    %BBDown% login
    echo 登陆完成,请关闭并重新运行本脚本
)
pause