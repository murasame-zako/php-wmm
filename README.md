# php with more modules

## 说明
php的cli与fpm镜像，但是是一个内置更多模块的php镜像，减少自己编译的时间，不再担心缺少某些模块需要自己来编译。包含了wordpress所推荐安装的模块。

## 使用

版本号不具有代表性，因为随时会嵌入新的模块，我将只维护比较新的版本，无论如何都请只使用latest标签。

```bash
# FastCGI
docker pull murasamezako/php-wmm-fpm:latest

# CLI
docker pull murasamezako/php-wmm-cli:latest
```

## 自己编译

```bash
git clone https://github.com/murasame-zako/php-wmm
cd php-wmm
docker build -t php-wmm-fpm php-fpm/
docker build -t php-wmm-cli php-cli/
```

## 模块概况

|附加嵌入的模块|来源|
|--|--|
|gd|附带|
|zip|附带|
|bz2|附带|
|intl|附带|
|gmp|附带|
|pdo_mysql|附带|
|mysqli|附带|
|pdo_pgsql|附带|
|pgsql|附带|
|exif|附带|
|xsl|附带|
|opcache|附带|
|imagick|PECL|
|memcached|PECL|
|yaml|PECL|
|snuffleupagus|https://github.com/jvoisin/snuffleupagus|