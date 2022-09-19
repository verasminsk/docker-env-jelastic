# docker-env-jelastic
Jelastic Docker env for local dev (nginx+php &amp;&amp; mysql)

for build env run "./_commands_docker/_!docker-build"

http://localhost:8088/ (app/default)

http://yii.loc:8088/ (app/symfony)

http://symfony.loc:8088/ (app/symfony)

├── _commands_docker<br/>
│   ├── _bash_db<br/>
│   ├── _bash_web<br/>
│   ├── _bash_web_mc<br/>
│   ├── _!docker-build<br/>
│   ├── _!docker_clear<br/>
│   ├── _!docker-down<br/>
│   ├── _docker-ip<br/>
│   ├── _!docker-rebuild_web<br/>
│   ├── _!docker-restart<br/>
│   ├── _!docker-stats<br/>
│   ├── _!docker-stop_all<br/>
│   ├── _!docker-top<br/>
│   ├── _!docker-up<br/>
│   └── my-docker.cfg<br/>
