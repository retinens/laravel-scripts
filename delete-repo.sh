#!/bin/bash -i
projectname=rest
source
curl -X DELETE  -H "Authorization: token $GH_TOKEN" https://api.github.com/repos/WhereIsLucas/rest


