#!/bin/sh
docker container run -it --rm --env NODE_ENV=production -v $(pwd):/home/node/app -w /home/node/app node:14-alpine sh