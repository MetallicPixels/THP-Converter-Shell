@echo off

set TOOLS=%CD%/tools/windows

if [%1]==[] echo This script requires one argument. Please pass it in. && goto:eof

set INFILE="%~f1"

if NOT %~x1==.mp4 echo The argument is a unsupported file. Please pass in a MP4 video && goto:eof

mkdir "%CD%/temp"

cmd /c "%TOOLS%/ffmpeg"

ffmpeg.exe -i %INFILE% -r 59.94 -vf scale=640:368 -qscale:v 2 "%CD%\temp\frame%%05d.jpg"

rm ffmpeg.exe

if [%2]==[-a] cmd /c "%TOOLS%/mplayer" && mplayer.exe -vo null -ao pcm:file=temp.wav %INFILE% && rm mplayer.exe

cmd /c "%TOOLS%/thpconv"

if [%2]==[-a] thpconv.exe -j temp/*.jpg -s temp.wav -r 59.94 -d output.thp -v && rm temp.wav

if [%2]==[] thpconv.exe -j temp/*.jpg -r 59.94 -d output.thp -v

ren output.thp "%~n1.thp"

rm thpconv.exe dsptool.dll

rm -r temp mplayer