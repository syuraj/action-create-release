#!/bin/bash

hub checkout master
hub release create -a ./${RELEASE_FILE_PATH} -m "${RELEASE_TITLE}" $(date +%Y%m%d%H%M%S)