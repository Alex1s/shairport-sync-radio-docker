#!/usr/bin/env sh
wget\
    --header="Authorization: Bearer $BEARER_TOKEN"\
    --post-data='{"entity_id": "'$ENTITY_ID'"}'\
    -O -\
    http://$HASS_HOST:$HASS_PORT/api/services/media_player/turn_off
