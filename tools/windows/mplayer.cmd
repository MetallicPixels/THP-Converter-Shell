@echo off

PowerShell Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/713385142277767200/892427429325463562/mplayer.zip" -OutFile mplayer.zip

PowerShell Expand-Archive -Path mplayer.zip -DestinationPath "%CD%"

rm mplayer.zip