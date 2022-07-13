#!/usr/bin/env bash
# shellcheck disable=SC2016

# A simple script for docker

OPTIONS=$1
PRODIR=$HOME/containers

if [ -z "${OPTIONS}" ];
then
    printf 'Following are flags:\n'
    printf '  Caddy\n'
    printf '    -ucaddy : caddy up\n'
    printf '    -dcaddy : caddy down\n'
    printf '  Portainer\n'
    printf '    -uportainer : portainer up\n'
    printf '    -dportainer : portainer down\n'
fi

if [ "${OPTIONS}" = "-ucaddy" ];
then
    docker-compose -f "$PRODIR/caddyserver/docker-compose.yml" up -d
fi

if [ "${OPTIONS}" = "-dcaddy" ];
then
    docker-compose -f "$PRODIR/caddyserver/docker-compose.yml" down
fi

if [ "${OPTIONS}" = "-uportainer" ];
then
    docker-compose -f "$PRODIR/portainer/docker-compose.yml" up -d
fi

if [ "${OPTIONS}" = "-dportainer" ];
then
    docker-compose -f "$PRODIR/portainer/docker-compose.yml" down
fi

if [ "${OPTIONS}" = "-ugotify" ];
then
    docker-compose -f "$PRODIR/gotify/docker-compose.yml" up -d
fi

if [ "${OPTIONS}" = "-dgotify" ];
then
    docker-compose -f "$PRODIR/gotify/docker-compose.yml" down
fi

if [ "${OPTIONS}" = "-unextcloud" ];
then
    docker-compose -f "$PRODIR/nextcloud/docker-compose.yml" up -d
fi

if [ "${OPTIONS}" = "-dnextcloud" ];
then
    docker-compose -f "$PRODIR/nextcloud/docker-compose.yml" down
fi

if [ "${OPTIONS}" = "-u"]