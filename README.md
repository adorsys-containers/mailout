[![](https://img.shields.io/docker/pulls/adorsys/mailout.svg?logo=docker&style=flat-square)](https://hub.docker.com/r/adorsys/mailout)
[![](https://img.shields.io/docker/stars/adorsys/mailout.svg?logo=docker&style=flat-square)](https://hub.docker.com/r/adorsys/mailout)

# adorsys/mailout

https://hub.docker.com/r/adorsys/mailout

## Description

MTA for sending mails inside containerized applications. 

See https://haraka.github.io/README.html or helm chart for documentation

If you are running Openshit enable STARTTLS quickly by enable "[Service Serving Certificate Secrets](https://docs.openshift.com/container-platform/3.11/dev_guide/secrets.html#service-serving-certificate-secrets)" and mount the
certificates inside the container under `/var/run/secrets/serving-cert-secret/`.

## Environment variables

| Name | Description | Default |
| ---- | ----------- | ------- |
| HARAKA_LOG_LEVEL | Define log level | `NOTICE` |
| HARAKA_LOG_TIMESTAMPS | prefix log lines with timestamps | `true` |
| HARAKA_HOSTNAME | hostname of the mailer | `relay.local` |
| HARAKA_PLUGINS_PREPEND | Enable additional plugins before defaults | `` |
| HARAKA_PLUGINS | Enable additional plugins | `` |
| HARAKA_RELAY | Define relay policy: https://haraka.github.io/manual/plugins/relay.html | `` |
| HARAKA_NODES | How many threads should spawn per process | `1` |
| HARAKA_TLS_CA_BUNDLE | path of the ca bundle if custom need | `/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem` | 
| HARAKA_TLS | Enable `STARTTLS` | `false` |
| HARAKA_TLS_LISTEN_KEY | Path of the listen tls key | `/var/run/secrets/serving-cert-secret/tls.key` |
| HARAKA_TLS_LISTEN_CERT | Path of the listen tls cert | `/var/run/secrets/serving-cert-secret/tls.crt` |
| HARAKA_AUTH_RELAY_USER | Username of the relay user for local auth | `relay` |
| HARAKA_AUTH_RELAY_PASSWORD | Password of the relay user for local auth | `` |
| HARAKA_RELAY_HOSTNAME | hostname of the smarthost | `` |
| HARAKA_RELAY_PORT | port of the smarthost | `25` |
| HARAKA_RELAY_AUTH_TYPE | auth method used for the smarthost | `PLAIN` |
| HARAKA_RELAY_AUTH_USER | auth user used for the smarthost | `` |
| HARAKA_RELAY_AUTH_PASS | auth user used for the smarthost | `` |

## Tags

| Name | Description | Size |
| ---- | ----------- | ---- |
| latest | - | [![](https://img.shields.io/microbadger/image-size/adorsys/mailout.svg?style=flat-square)](https://microbadger.com/images/adorsys/mailout) |

