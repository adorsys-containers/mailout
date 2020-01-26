#!/bin/sh

# log.ini
if [ -n "${HARAKA_LOG_LEVEL+x}" ]; then
    echo "level=${HARAKA_LOG_LEVEL}"      >> /opt/app-root/config/log.ini
    unset HARAKA_LOG_LEVEL
fi

if [ -n "${HARAKA_LOG_TIMESTAMPS+x}" ]; then
    echo "timestamps=${HARAKA_LOG_TIMESTAMPS}" >> /opt/app-root/config/log.ini
    unset HARAKA_LOG_TIMESTAMPS
fi

# me
if [ -n "${HARAKA_HOSTNAME+x}" ]; then
    echo "${HARAKA_HOSTNAME}" > /opt/app-root/config/me
    unset HARAKA_HOSTNAME
fi

# plugins
if [ -n "${HARAKA_PLUGINS_PREPEND+x}" ]; then
    _DEFAULT_PLUGINS=$(cat /opt/app-root/config/plugins)

    echo "${HARAKA_PLUGINS_PREPEND}" | tr , '\n' >  /opt/app-root/config/plugins
    echo ""                                      >> /opt/app-root/config/plugins
    echo "${_DEFAULT_PLUGINS}"                   >> /opt/app-root/config/plugins

    unset _DEFAULT_PLUGINS
    unset HARAKA_PLUGINS_PREPEND
fi

if [ -n "${HARAKA_PLUGINS+x}" ]; then
    echo "${HARAKA_PLUGINS}" | tr , '\n' >> /opt/app-root/config/plugins
    unset HARAKA_PLUGINS
fi

# relay
if [ -n "${HARAKA_RELAY+x}" ]; then
    echo "relay=${HARAKA_RELAY}" >> /opt/app-root/config/relay.ini
    unset HARAKA_RELAY
fi

# smtp
if [ -n "${HARAKA_NODES+x}" ]; then
    echo "nodes=${HARAKA_NODES}" >> /opt/app-root/config/smtp.ini
    unset HARAKA_NODES
fi

# tls
if [ -n "${HARAKA_TLS+x}" ] && [ "${HARAKA_TLS}" = "true" ]; then
    echo "tls" >> /opt/app-root/config/plugins
    unset HARAKA_TLS

    if [ -n "${HARAKA_TLS_LISTEN_KEY+x}" ]; then
        echo "key=${HARAKA_TLS_LISTEN_KEY}"   >> /opt/app-root/config/tls.ini
        unset HARAKA_TLS_LISTEN_KEY
    fi

    if [ -n "${HARAKA_TLS_LISTEN_CERT+x}" ]; then
        echo "cert=${HARAKA_TLS_LISTEN_CERT}" >> /opt/app-root/config/tls.ini
        unset HARAKA_TLS_LISTEN_CERT
    fi

    {
      echo "[outbound]"
      echo "key="
      echo "cert="
    } >> /opt/app-root/config/tls.ini
fi

if [ -n "${HARAKA_TLS_CA_BUNDLE+x}" ]; then
    echo "ca=${HARAKA_TLS_CA_BUNDLE}" >> /opt/app-root/config/tls.ini
    unset HARAKA_TLS_CA_BUNDLE
fi

# auth
if [ -n "${HARAKA_AUTH_RELAY_USER+x}" ] && [ -n "${HARAKA_AUTH_RELAY_PASSWORD+x}" ]; then
    echo "${HARAKA_AUTH_RELAY_USER}=${HARAKA_AUTH_RELAY_PASSWORD}" >> /opt/app-root/config/auth_flat_file.ini
    unset HARAKA_AUTH_RELAY_USER
    unset HARAKA_AUTH_RELAY_PASSWORD
fi

# smarthost/relay
if [ -n "${HARAKA_RELAY_HOSTNAME+x}" ]; then
    echo "host=${HARAKA_RELAY_HOSTNAME}"       >> /opt/app-root/config/smtp_smarthost.ini
    unset HARAKA_RELAY_HOSTNAME
fi

if [ -n "${HARAKA_RELAY_PORT+x}" ]; then
    echo "port=${HARAKA_RELAY_PORT}"           >> /opt/app-root/config/smtp_smarthost.ini
    unset HARAKA_RELAY_PORT
fi

if [ -n "${HARAKA_RELAY_AUTH_TYPE+x}" ]; then
    echo "auth_type=${HARAKA_RELAY_AUTH_TYPE}" >> /opt/app-root/config/smtp_smarthost.ini
    unset HARAKA_RELAY_AUTH_TYPE
fi

if [ -n "${HARAKA_RELAY_AUTH_USER+x}" ]; then
    echo "auth_user=${HARAKA_RELAY_AUTH_USER}" >> /opt/app-root/config/smtp_smarthost.ini
    unset HARAKA_RELAY_AUTH_USER
fi

if [ -n "${HARAKA_RELAY_AUTH_PASS+x}" ]; then
    echo "auth_pass=${HARAKA_RELAY_AUTH_PASS}" >> /opt/app-root/config/smtp_smarthost.ini
    unset HARAKA_RELAY_AUTH_PASS
fi
