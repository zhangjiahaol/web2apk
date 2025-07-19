@echo off
echo 开始构建APK...

REM 清理项目
echo 清理项目...
call gradlew clean

REM 构建debug版本
echo 构建debug版本...
call gradlew assembleDebug

REM 检查构建结果
if exist "app\build\outputs\apk\debug\app-debug.apk" (
    echo APK构建成功！
    echo APK位置: app\build\outputs\apk\debug\app-debug.apk
    echo.
    echo 请检查以下内容：
    echo 1. 确保手机已开启"未知来源"应用安装权限
    echo 2. 确保手机Android版本 >= 5.0 (API 21)
    echo 3. 如果仍有问题，请尝试重新安装
) else (
    echo APK构建失败，请检查错误信息
)

pause 