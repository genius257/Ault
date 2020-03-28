@echo off

setlocal

CD "%~dp0\tests\"

"%~dp0\au3pm\au3unit\build\au3unit.exe" %*
