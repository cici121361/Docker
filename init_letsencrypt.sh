#!/bin/bash
domains=cici.mooplab.com
data_path="./data/certbot"
email="540702551@qq.com"

if [-d "$data_path"]; then
	read -p "Existing data found for $domains. Continue and replace existing certificate?(y/N)" decision
	if ["$decision" != "Y"] && ["$decision" != "y"]; then
	    exit
	fi
fi

if [! -e "$data_path/conf/options-ssl-nginx.conf"] || [! -e "$data_path/conf/ssl-dhparams.pem"]; then
  echo "### Downloading recommended TLS parameters ..."
  mkdir -p "$data_path/conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > "$data_path/conf/options-ssl-nginx.conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > "$data_path/conf/ssl-dhparams.pem"
  echo
fi

echo "### Starting nginx ..."
docker-compose up --force-recreate -d nginx
echo

echo "### creating dummy certificate for $domains ..."
path="/etc/letsencrypt/live/$domains"
mkdir -p "$data_path/conf/live/$domains"
docker-compose run --rm --entrypoint "\
	openssl req -x509 -nodes -newkey rsa:$rsa_
