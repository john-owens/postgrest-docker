Using [gliberlabs/alpine](https://hub.docker.com/r/gliderlabs/alpine/) to implement a docker image of Postgres: http://postgrest.com/

Run the centos image atm, not gotten alpine to work yet.

=Example run command=

>docker run -P --name <instance name> -d <image name> >postgres://jentrata:jentrata@<machine ip>:5100/<db>  --port 3000 --pool 10 >--schema public --anonymous <anon user>
