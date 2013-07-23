#!/bin/bash

# Need httpd stopped but mongo running
service httpd stop
echo "db.queued_calls.drop();" >> /tmp/queued_calls.js
mongo pulp_database < /tmp/queued_calls_drop.js
katello-service restart
