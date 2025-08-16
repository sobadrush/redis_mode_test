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

```bash
# 手動觸發對 `mymaster 群組` 的故障轉移
$ redis-cli -p 26379 -a sa12345 SENTINEL FAILOVER mymaster

# 向 Sentinel 查詢目前 mymaster 的 ip / port
$ redis-cli -p 26379 -a sa12345 SENTINEL get-master-addr-by-name mymaster

# 檢查 Redis 當前的角色
$ redis-cli -p 6379 -a sa123456 ROLE
$ redis-cli -p 6380 -a sa123456 ROLE
$ redis-cli -p 6381 -a sa123456 ROLE
```

## 重新指定 master
```bash
# 先將各台都設為 master
# 將 redis-master (6379), redis-slave1 (6380), redis-slave2 (6381) 設定為 master
# NO ONE 代表「不從屬於任何人」= master
$ redis-cli -p 6379 -a sa123456 REPLICAOF NO ONE
$ redis-cli -p 6380 -a sa123456 REPLICAOF NO ONE
$ redis-cli -p 6381 -a sa123456 REPLICAOF NO ONE

# 將 redis-slave1 (6380), redis-slave2 (6381) 設定為 redis-master (6379) 的 slave
$ redis-cli -p 6380 -a sa123456 REPLICAOF redis-master 6379
$ redis-cli -p 6381 -a sa123456 REPLICAOF redis-master 6379
```