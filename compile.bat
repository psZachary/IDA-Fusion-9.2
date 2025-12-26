@echo off
setlocal EnableDelayedExpansion

set IDA_PLUGIN_DIR=./
set "OUTPUT_FILE=fusion64.dll"
set "BUILD_FOR=64"

tasklist | findstr /i ida64.exe >nul && (
  echo [INFO] Closing IDA...
  taskkill /f /im ida64.exe
)

if not exist obj (
  echo [INFO] Creating temporary directory 'obj'...
  mkdir obj
)

echo [INFO] Starting build process with %NUMBER_OF_PROCESSORS% processors for 64-bit...
make make_objects -j%NUMBER_OF_PROCESSORS%
if !errorlevel! neq 0 (
  echo [ERROR] Failed to make objects.
  exit /b !errorlevel!
)

make make_output
if !errorlevel! neq 0 (
  echo [ERROR] Failed to make output.
  exit /b !errorlevel!
)

echo [INFO] Deleting temporary directory 'obj'...
rmdir /S /Q obj

echo [INFO] Build completed successfully.