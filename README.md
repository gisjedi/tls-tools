# SSL testing tools

Random collection of stuff collected to assist with testing TLS/SSL connections
from popular web servers (haproxy/apache/nginx). All CA commands stolen from the
phenomal guide at https://jamielinux.com/docs/openssl-certificate-authority/index.html

## Stuff

- /ca/init-ca.sh: shell script to initialize a CA for signing user/server certs
- /helper/gen-usr.sh: shell script taking a single parameter for user cert name
- /server/haproxy.cfg: config to use CA cert for server and require client cert