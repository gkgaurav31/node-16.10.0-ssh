# TO TEST

docker build -t test .  
docker rm -f test  
docker run -d -p 3000:3000 -p 2222:2222 --name test test  
docker logs test

## TEST SSH

```plaintext
ssh root@localhost -p 2222
root@localhost's password:
Last login: Mon Sep 30 04:26:53 2024 from 172.17.0.1

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/\*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
root@79ea33987ea1:~#
```

Note: The root password needs to be be Docker!.  
**This is a sample and will not be maintained.**
