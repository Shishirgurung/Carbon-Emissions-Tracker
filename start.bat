@echo off
echo Starting Carbon Emissions Tracker...
echo.

echo Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo Failed to install frontend dependencies
    pause
    exit /b 1
)

echo Installing server dependencies...
cd server
call npm install
if %errorlevel% neq 0 (
    echo Failed to install server dependencies
    pause
    exit /b 1
)
cd ..

echo.
echo Starting servers...
echo Backend will start on http://localhost:5000
echo Frontend will start on http://localhost:3000
echo.

start "Backend Server" cmd /k "cd server && npm run dev"
timeout /t 3 /nobreak > nul
start "Frontend Server" cmd /k "npm run dev"

echo.
echo Both servers are starting...
echo Check the opened terminal windows for status
echo.
pause
