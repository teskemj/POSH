# Container FAQ

[Great cummulative list of all things containers](https://dbafromthecold.com/2017/03/15/summary-of-my-container-series/)
[Nocentino github presentations](https://github.com/nocentino/Presentations/blob/master/PowerShellSummit-2019/Containers%20You%20Better%20Get%20on%20Board/demos/demo_ps.sh)

```docker

docker pull mcr.microsoft.com/windowsservercore-insider
docker run -e 'ACCEPT_EULA=Y' -e MSSQL_SA_PASSWORD='P@ssw0rd' --name 'sql1' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest
```

``` powershell
# Get list of images at mcr.microsoft.com
(Invoke-Webrequest https://mcr.microsoft.com/v2/server/tags/list).content
(Invoke-Webrequest https://mcr.microsoft.com/v2/windows/server/tags/list).content
```

[2019 Container Images | Thomas Maurer](https://www.thomasmaurer.ch/2018/11/windows-server-2019-container-images/)

[Containers on Windows Documentation](https://docs.microsoft.com/en-us/virtualization/windowscontainers/)

[Create a SQL Server on Linux Container with 5 lines of Code](https://www.mssqltips.com/sqlservertip/6007/create-a-sql-server-on-linux-container-with-5-lines-of-code/)

https://blog.sqlauthority.com/2019/09/29/how-to-download-the-latest-sql-server-docker-image-interview-question-of-the-week-244/

|Topic | Topic |Test |
|-----|-----|-------------|
|Desktop|DBATools|Lab Environment|
|Docker|Images|Databases|

1. this step
1. next step
    1. substep
    1. dubstep


