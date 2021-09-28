@echo off

PowerShell Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/713385142277767200/892426067455901696/THPConv.zip" -OutFile THPConv.zip

PowerShell Expand-Archive -Path THPConv.zip -DestinationPath "%CD%"

rm THPConv.zip