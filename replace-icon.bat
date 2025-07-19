@echo off
echo ========================================
echo           图标替换工具
echo ========================================
echo.
echo 请将您的图标文件命名为 icon.png 并放在项目根目录
echo 然后按任意键继续...
pause

REM 检查图标文件是否存在
if not exist "icon.png" (
    echo.
    echo 错误：找不到 icon.png 文件
    echo 请将您的图标文件命名为 icon.png 并放在项目根目录
    echo.
    pause
    exit /b 1
)

echo.
echo 开始替换图标...

REM 复制图标到各个密度文件夹
echo 替换 mipmap-mdpi 图标...
copy "icon.png" "app\src\main\res\mipmap-mdpi\ic_launcher.png" /Y >nul
copy "icon.png" "app\src\main\res\mipmap-mdpi\ic_launcher_round.png" /Y >nul

echo 替换 mipmap-hdpi 图标...
copy "icon.png" "app\src\main\res\mipmap-hdpi\ic_launcher.png" /Y >nul
copy "icon.png" "app\src\main\res\mipmap-hdpi\ic_launcher_round.png" /Y >nul

echo 替换 mipmap-xhdpi 图标...
copy "icon.png" "app\src\main\res\mipmap-xhdpi\ic_launcher.png" /Y >nul
copy "icon.png" "app\src\main\res\mipmap-xhdpi\ic_launcher_round.png" /Y >nul

echo 替换 mipmap-xxhdpi 图标...
copy "icon.png" "app\src\main\res\mipmap-xxhdpi\ic_launcher.png" /Y >nul
copy "icon.png" "app\src\main\res\mipmap-xxhdpi\ic_launcher_round.png" /Y >nul

echo 替换 mipmap-xxxhdpi 图标...
copy "icon.png" "app\src\main\res\mipmap-xxxhdpi\ic_launcher.png" /Y >nul
copy "icon.png" "app\src\main\res\mipmap-xxxhdpi\ic_launcher_round.png" /Y >nul

echo.
echo ========================================
echo           图标替换完成！
echo ========================================
echo.
echo 下一步操作：
echo 1. 运行 build-apk.bat 重新构建APK
echo 2. 卸载旧版本应用
echo 3. 安装新版本APK
echo.
pause 