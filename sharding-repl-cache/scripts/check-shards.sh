#!/bin/bash

docker compose exec -T shard1-a mongosh --port 27025  <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

docker compose exec -T shard2-a mongosh --port 27028  <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF