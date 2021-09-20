FROM mcr.microsoft.com/windows/servercore:ltsc2019
COPY . C:/
RUN powershell.exe -Command Start-Process C:\OSV.14.3.exe -ArgumentList "/quiet", "INSTALLLEVEL=2" -Wait
RUN powershell.exe -Command Remove-Item -Path 'C:\Program Files (x86)\TRICENTIS\Tosca OSV\Config' -recurse
CMD [ "C:\\Program Files (x86)\\TRICENTIS\\Tosca OSV\\Tricentis.OSV.Host.exe" ]
CMD [ "cmd" ]
