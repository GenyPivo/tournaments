For run
```
    $ docker-compose build
    $ docker-compose run web rake db:create db:migrate db:seed assets:precompile
    $ docker-compose up
```
Go to http://127.0.0.1:3000
