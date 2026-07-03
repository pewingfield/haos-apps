#!/bin/bash
echo "========== LUBELOGGER STARTING $(date) =========="

mkdir -p /data/keys
export LUBELOGGER_USERDATA_DIRECTORY=/data/
export ASPNETCORE_URLS=http://+:8080
export ASPNETCORE_HTTP_PORTS=8080
export ASPNETCORE_HTTPS_PORTS=""

exec dotnet /App/CarCareTracker.dll