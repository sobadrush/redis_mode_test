# 這是一個測試 Redis Sentinel 與 Master-replica 的專案


```bash
# 查看 sentinel info
$ redis-cli -p 26379 -a sa12345 info sentinel
```

```bash
# 查看 replica info
$ redis-cli -p 6379 -a sa123456 info replication
```

```bash
# 檢查網路
$ docker networks ls

# 查看容器使用的網路
$ docker container inspect -f "{{.HostConfig.NetworkMode}}" ${容器名稱}

# 查看容器IP
$ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${容器名稱}
```