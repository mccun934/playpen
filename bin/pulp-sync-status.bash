#!/bin/bash

curl -s -k -u admin:admin https://localhost/pulp/api/v2/tasks/  |json_reformat  |grep items_left |grep -v "\"items_left\": 0"

