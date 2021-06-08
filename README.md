Redis cluster Ansible Role
=========

Role Variables
--------------

- `redis_bind_addr`: This is the address that both Redis and Sentinel will bind to. (Default: `0.0.0.0`)
- `redis_port`: Port used by Redis. (Default: `6379`)
- `redis_sentinel_port`: Port used by Sentinel. (Default: `26379`)
- `redis_sentinel_quorum`: Sentinel Quorum. (Default: `2`)
- `redis_sentinel_down_after`: Sentinel `down-after-milliseconds` value. (Default: `10000`)
- `redis_sentinel_failover_timeout`: Sentinel `failover-timeout` value. (Default: `10000`)
- `redis_version`: Redis version to install. (Default: `6.2.4`)
- `redis_initial_master`: Initial master node. (Default: `redis-1`)
- `redis_initial_master_ip`: Initial master node IP. (Default: `"{{ hostvars[redis_initial_master].ansible_default_ipv4.address }}"`)
- `redis_preflight`: Check if Redis is installed and matches the target version. When all the Redis binaries are present and the installed version matches the target, the role will only update configuration files. (Default: `yes`)

# Running Molecule locally
## Playground
```
make molecule-destroy
make molecule-converge

docker ps
CONTAINER ID   NAMES
2d90009c52f0   redis-3
fc0e79c37d27   redis-2
cfbae4d15dbf   redis-1

docker exec -it cfbae4d15dbf bash
```
## Running tests
```
make molecule-test
```
