@echo off
set BBDown=".\BBDown.exe"
set ffmpeg=".\ffmpeg.exe"

echo BBDOWN下载脚本
echo verson:0.2_0421
echo made by TenSin
echo Github:https://github.com/SkyDream01/BBDOWN_BAT
setlocal enabledelayedexpansion
IF EXIST "BBDown.data" (
    IF EXIST "Download" (
	
	set /p url=请输入视频bv号或av号:
	
	echo 菜单：
	echo 0.自行输入
	echo 1.默认
	echo 2.仅下载视频
	echo 3.仅下载音频
	echo 4.仅下载字幕
	echo 5.交互式选择清晰度
	echo 6.Hires资源下载（by：DRV）
	echo 7.提取字幕
	
	
    set /p opt=Options选择（纯数字）:
	echo 正在执行...
	
	IF !opt!==0 (
		start "" ".\help.txt"
		set /p code=bbdown !url! 
		%BBDown% !code! !url!	
	)
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
	IF !opt!==7 (
 	    %BBDown% !url!
		echo 资源下载完成
		echo 正在提取字幕...
		for %%a in (*.mp4) do (
    	    %ffmpeg% -i "%%~na.mp4" -map 0:s:0 "%%~na.srt"
			)
		)
	for %%a in (*.m4a) do (
    	    move *.m4a .\Download\
 	   )
	for %%a in (*.mp4) do (
    	    move *.mp4 .\Download\
 	   )
	for %%a in (*.srt) do (
    	    move *.srt .\Download\
 	   )
	for %%a in (*.flac) do (
    	    move *.flac .\Download\
		)
echo 下载完成

)ELSE (
echo 创建Download文件夹,已自动重启
md .\Download
call BBDOWN_BAT.bat
exit
)

) ELSE (
    echo 没有登录
    echo 请扫描二维码以登陆您的B站账号
    %BBDown% login
    echo 登陆完成,已自动重启
	call BBDOWN_BAT.bat
	exit
)
pause