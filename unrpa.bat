@echo off
setlocal EnableDelayedExpansion

REM 设置代码页为 UTF-8 以避免中文乱码
chcp 65001 >nul

REM 检查输入
if "%~1"=="" (
    echo 请将 .rpa 文件拖拽到此脚本上！
    pause
    exit /b
)

REM 完整文件路径
set "FILE=%~1"
set "DIR=%~dp1"
set "OUT=%DIR%unrpa"

REM 检查文件是否存在
if not exist "!FILE!" (
    echo 错误：文件 "!FILE!" 不存在！
    pause
    exit /b
)

REM 创建输出目录
if not exist "!OUT!" (
    mkdir "!OUT!"
)

echo 正在提取："!FILE!"
echo 输出目录："!OUT!"
echo.

REM 调试：显示 Python 版本
echo 检查 Python 环境：
py -3 --version
echo.

REM 设置命令，确保路径被正确引用
set "PY_CMD=py -3 -m unrpa -mp "!OUT!" "!FILE!""
echo 调试：执行命令：!PY_CMD!
echo.

REM 执行命令
cmd /c "!PY_CMD!"

endlocal
pause