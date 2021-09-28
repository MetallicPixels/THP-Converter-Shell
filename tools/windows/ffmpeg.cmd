@echo off

PowerShell Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/713385142277767200/892424426363183204/ffmpeg.zip" -OutFile ffmpeg.zip

PowerShell Expand-Archive -Path ffmpeg.zip -DestinationPath "%CD%"

rm ffmpeg.zip