@echo off

set TOOLS=%CD%/tools/windows

if [%1]==[] echo This script requires one argument. Please pass it in. && goto:eof

set INFILE="%~f1"

if NOT %~x1==.thp echo The argument is a unsupported file. Please pass in a THP video && goto:eof

cmd /c "%TOOLS%/ffmpeg"

ffmpeg.exe -i %INFILE% "%~n1.mp4"

if [%2]==[-move] mv "%~n1.mp4" "%~p1"

rm ffmpeg.exe