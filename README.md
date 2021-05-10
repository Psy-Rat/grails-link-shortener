* create-app shorturl

* create-domain-class User

* create-domain-class Link

# Отношения
Определяются статическими полями belongsTo для связи типа 1 к 1 и hasMany для 1 к Многим


* create-controller User

* create-controller Link

> Замыкания тоже работают для маппинга юрл к контроллеру

Метод registration в UserController был автоматически привязан к темплейту registration.gsp
В ней, действием POST всё сабмитится по url addUser

Полезный и охуенный плагин (Можно доставать домены без контекста!)
https://github.com/sheehan/grails-console

* create-service User


    runtime "org.postgresql:postgresql:9.4.1208.jre7"
    runtime 'org.grails.plugins:grails-console:2.1.1'
    runtime 'com.bertramlabs.plugins:asset-pipeline-grails:3.0.10'
    >/application.yml
    environments:
    development:
        dataSource:
            dbCreate: update
            url: '[driver group]:[drivername]://[url]'

conf/application.groovy (sic!) → dataSource
https://stackoverflow.com/questions/19691940/grails-and-sqlite

Книжонка
https://www.infoq.com/minibooks/grails-getting-started/