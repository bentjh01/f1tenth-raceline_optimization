#!/bin/sh

container_name="raceline_optimisation_tmp"

function create_ws_container {
    docker run -it --rm \
        --name $container_name \
        --network=host \
        --volume="$(pwd)/":"/root/f1tenth_raceline_optimization" \
        bentjh01/f1tenth:raceline_optimisation_tmp
}
#-h "f1tenth_bt" \

if [ "$(docker ps -aq -f status=running -f name=${container_name})" ]
then
	echo "Container is Running. Starting new session."
	docker exec -it ${container_name} bash 
else
    echo "Starting container"
    create_ws_container
fi

