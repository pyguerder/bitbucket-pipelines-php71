# Bitbucket Pipelines PHP 5.6 image

[![](https://images.microbadger.com/badges/version/pyguerder/bitbucket-pipelines-php71.svg)](https://microbadger.com/images/pyguerder/bitbucket-pipelines-php71 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/pyguerder/bitbucket-pipelines-php71.svg)](https://microbadger.com/images/pyguerder/bitbucket-pipelines-php71 "Get your own image badge on microbadger.com")

## Based on Ubuntu 16.04

### Packages installed

- `php5.6-dev`, `php5.6-zip`, `php5.6-xml`, `php5.6-mbstring`, `php5.6-curl`, `php5.6-json`, `php5.6-mysql`, `php5.6-tokenizer`, `php5.6-cli`, `php5.6-imap`, `php5.6-intl`, `php5.6-gd`
- [Composer](https://getcomposer.org/)
- Mysql 5.7

### Sample `bitbucket-pipelines.yml`

```YAML
image: pyguerder/bitbucket-pipelines-php71:php5.6
pipelines:
  default:
    - step:
        script:
          - service mysql start
          - mysql -h localhost -u root -proot -e "CREATE DATABASE test;"
          - composer install --no-interaction --no-progress --prefer-dist
          - ./vendor/phpunit/phpunit/phpunit -v --coverage-text --colors=never --stderr
```
