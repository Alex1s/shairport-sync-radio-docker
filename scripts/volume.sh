#!/usr/bin/env sh

echo Original Volume: $1

vol=$(echo "1+($1)/30"|bc -l|awk '{printf "%f", $0}')
echo Volume: $vol

wget\
    --header="Authorization: Bearer $BEARER_TOKEN"\
    --post-data='{"volume_level": '$vol',"entity_id": "'$ENTITY_ID'"}'\
    -O -\
    http://$HASS_HOST:$HASS_PORT/api/services/media_player/volume_set
