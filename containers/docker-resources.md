# Container FAQ

[Great cummulative list of all things containers](https://dbafromthecold.com/2017/03/15/summary-of-my-container-series/)
[Nocentino github presentations](https://github.com/nocentino/Presentations/blob/master/PowerShellSummit-2019/Containers%20You%20Better%20Get%20on%20Board/demos/demo_ps.sh)


``` docker

docker pull mcr.microsoft.com/windowsservercore-insider

```

``` powershell
# Get list of images at mcr.microsoft.com
(Invoke-Webrequest https://mcr.microsoft.com/v2/server/tags/list).content
(Invoke-Webrequest https://mcr.microsoft.com/v2/windows/server/tags/list).content
```
[2019 Container Images | Thomas Maurer](https://www.thomasmaurer.ch/2018/11/windows-server-2019-container-images/)
[Containers on Windows Documentation](https://docs.microsoft.com/en-us/virtualization/windowscontainers/)