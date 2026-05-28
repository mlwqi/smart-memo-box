@echo off
REM ============================================================
REM  智能备忘盒 - Android APK 构建脚本 (Windows)
REM  需要: Java 17+ 和 Android SDK
REM ============================================================

echo [1/3] 检查环境...
where java >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未找到 Java，请安装 JDK 17+
    echo 下载: https://adoptium.net/
    pause
    exit /b 1
)

if "%ANDROID_HOME%"=="" (
    if not exist "%USERPROFILE%\AppData\Local\Android\Sdk" (
        echo [错误] 未找到 Android SDK
        echo 请安装 Android Studio 并确保 ANDROID_HOME 环境变量已设置
        pause
        exit /b 1
    )
    set ANDROID_HOME=%USERPROFILE%\AppData\Local\Android\Sdk
)

echo [2/3] 构建 Debug APK...
call ./gradlew assembleDebug
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 构建失败，请检查错误信息
    pause
    exit /b 1
)

echo [3/3] 完成!
echo.
echo APK 文件位置:
echo   android\app\build\outputs\apk\debug\app-debug.apk
echo.
pause
