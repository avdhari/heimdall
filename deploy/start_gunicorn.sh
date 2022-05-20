
PROJECR_DIR=/root/deploys/heimdall
PORT=80
SOCK="0.0.0.0:$PORT"
USER=root
GROUP=root
WORKERS=3
SETTINGS_MODULE=config.settings.production
WSGI_MODULE=config.wsgi
TIMEOUT=180
NAME="heimdall $PORT"

echo "Initiating $NAME as `whoami`"


cd $PROJECR_DIR
source ~/.Envs/heimdall/bin/activate
source ~/.Envs/heimdall/bin/postactivate


exec gunicorn ${WSGI_MODULE}:application \
  --name "$NAME" \
  --workers $WORKERS \
  --user=$USER --group=$GROUP \
  --bind=$SOCK \
  --log-level=info \
  --timeout=${TIMEOUT} \
  --log-file=- \
  --env DJANGO_SETTINGS_MODULE=$SETTINGS_MODULE
