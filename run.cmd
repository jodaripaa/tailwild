@echo off
REM Helper script: build and run docker-compose for Windows cmd.exe
setlocal

echo Building and starting containers (docker-compose)...
docker-compose up --build --remove-orphans
