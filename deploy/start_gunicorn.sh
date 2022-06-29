#! /bin/bash


PROJECR_DIR=/root/deploys/heimdall
SOCKFILE="/var/run/heimdall-gunicorn.sock"
USER=root
GROUP=root
WORKERS=5
SETTINGS_MODULE=config.settings.production
WSGI_MODULE=config.wsgi
TIMEOUT=180
NAME="heimdall"

echo "Initiating $NAME as `whoami`"


cd $PROJECR_DIR
source ~/.Envs/heimdall/bin/activate
source ~/.Envs/heimdall/bin/postactivate


exec gunicorn ${WSGI_MODULE}:application \
	  --name "$NAME" \
	  --workers $WORKERS \
	  --user=$USER --group=$GROUP \
	  --bind=unix:$SOCKFILE \
	  --log-level=info \
	  --timeout=${TIMEOUT} \
	  --log-file=- \
	  --env DJANGO_SETTINGS_MODULE=$SETTINGS_MODULE