@echo off
echo ========================================
echo           图标生成工具
echo ========================================
echo.
echo 此工具将帮助您生成不同尺寸的应用图标
echo.
echo 请将您的原始图标文件命名为 original-icon.png 并放在项目根目录
echo 建议原始图标尺寸：512x512 像素或更大
echo.
echo 然后按任意键继续...
pause

REM 检查原始图标文件是否存在
if not exist "original-icon.png" (
    echo.
    echo 错误：找不到 original-icon.png 文件
    echo 请将您的原始图标文件命名为 original-icon.png 并放在项目根目录
    echo.
    pause
    exit /b 1
)

echo.
echo 开始生成不同尺寸的图标...

REM 创建临时文件夹
if not exist "temp_icons" mkdir temp_icons

echo 正在生成图标尺寸...

REM 使用ImageMagick生成不同尺寸（如果安装了ImageMagick）
where magick >nul 2>nul
if %errorlevel% equ 0 (
    echo 使用ImageMagick生成图标...
    
    REM 生成不同尺寸的图标
    magick "original-icon.png" -resize 48x48 "temp_icons\ic_launcher_48.png"
    magick "original-icon.png" -resize 72x72 "temp_icons\ic_launcher_72.png"
    magick "original-icon.png" -resize 96x96 "temp_icons\ic_launcher_96.png"
    magick "original-icon.png" -resize 144x144 "temp_icons\ic_launcher_144.png"
    magick "original-icon.png" -resize 192x192 "temp_icons\ic_launcher_192.png"
    
    echo 图标生成完成！
) else (
    echo ImageMagick未安装，将使用原始图标进行复制...
    echo 建议安装ImageMagick以获得更好的图标质量
    echo 下载地址：https://imagemagick.org/script/download.php
    echo.
    
    REM 直接复制原始图标
    copy "original-icon.png" "temp_icons\ic_launcher_48.png" /Y >nul
    copy "original-icon.png" "temp_icons\ic_launcher_72.png" /Y >nul
    copy "original-icon.png" "temp_icons\ic_launcher_96.png" /Y >nul
    copy "original-icon.png" "temp_icons\ic_launcher_144.png" /Y >nul
    copy "original-icon.png" "temp_icons\ic_launcher_192.png" /Y >nul
)

echo.
echo 开始替换应用图标...

REM 复制到各个密度文件夹
echo 替换 mipmap-mdpi 图标...
copy "temp_icons\ic_launcher_48.png" "app\src\main\res\mipmap-mdpi\ic_launcher.png" /Y >nul
copy "temp_icons\ic_launcher_48.png" "app\src\main\res\mipmap-mdpi\ic_launcher_round.png" /Y >nul

echo 替换 mipmap-hdpi 图标...
copy "temp_icons\ic_launcher_72.png" "app\src\main\res\mipmap-hdpi\ic_launcher.png" /Y >nul
copy "temp_icons\ic_launcher_72.png" "app\src\main\res\mipmap-hdpi\ic_launcher_round.png" /Y >nul

echo 替换 mipmap-xhdpi 图标...
copy "temp_icons\ic_launcher_96.png" "app\src\main\res\mipmap-xhdpi\ic_launcher.png" /Y >nul
copy "temp_icons\ic_launcher_96.png" "app\src\main\res\mipmap-xhdpi\ic_launcher_round.png" /Y >nul

echo 替换 mipmap-xxhdpi 图标...
copy "temp_icons\ic_launcher_144.png" "app\src\main\res\mipmap-xxhdpi\ic_launcher.png" /Y >nul
copy "temp_icons\ic_launcher_144.png" "app\src\main\res\mipmap-xxhdpi\ic_launcher_round.png" /Y >nul

echo 替换 mipmap-xxxhdpi 图标...
copy "temp_icons\ic_launcher_192.png" "app\src\main\res\mipmap-xxxhdpi\ic_launcher.png" /Y >nul
copy "temp_icons\ic_launcher_192.png" "app\src\main\res\mipmap-xxxhdpi\ic_launcher_round.png" /Y >nul

REM 清理临时文件
rmdir /s /q temp_icons >nul 2>nul

echo.
echo ========================================
echo           图标生成完成！
echo ========================================
echo.
echo 下一步操作：
echo 1. 运行 build-apk.bat 重新构建APK
echo 2. 卸载旧版本应用
echo 3. 安装新版本APK
echo.
echo 提示：如果图标显示效果不理想，建议：
echo - 使用更高分辨率的原始图标
echo - 安装ImageMagick以获得更好的缩放效果
echo.
pause 