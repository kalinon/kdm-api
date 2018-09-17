#!/usr/bin/env bash
#rake swagger SWAGGER_HOST=kdm-api.com
docker build . -t kalinon/kdm-api \
    && docker push kalinon/kdm-api
