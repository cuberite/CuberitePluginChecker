@echo off
rem This is a sample invocation of the Checker that checks the MinimalPlugin using the API description in DummyApiDesc
rem This script is for Windows; a similar one could be made for Linux


setlocal
cd ..
lua CuberitePluginChecker.lua -a tests/DummyApiDesc -p tests/MinimalPlugin -g -c
