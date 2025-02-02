#!/bin/bash

docker compose exec -T mongos_router mongosh --port 27024 <<EOF

sh.addShard("shard1/shard1-a:27025");
sh.addShard("shard1/shard1-b:27026");
sh.addShard("shard1/shard1-c:27027");
sh.addShard("shard2/shard2-a:27028");
sh.addShard("shard2/shard2-b:27029");
sh.addShard("shard2/shard2-c:27023");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )
EOF

docker compose exec -T mongos_router mongosh --port 27024 <<EOF

use somedb

for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})

db.helloDoc.countDocuments() 
exit();
EOF