#!/bin/bash

docker compose exec -T shard1-a mongosh --port 27025  <<EOF
rs.initiate(
  {
    _id : "shard1",
    members: [
      { _id: 0, host : "shard1-a:27025" },
      { _id: 1, host: "shard1-b:27026" },
      { _id: 2, host: "shard1-c:27027" }
    ]
  }
);
exit();
EOF

docker compose exec -T shard2-a mongosh --port 27028  <<EOF
rs.initiate(
  {
    _id : "shard2",
    members: [
      { _id: 0, host : "shard2-a:27028" },
      { _id: 1, host: "shard2-b:27029" },
      { _id: 2, host: "shard2-c:27023" }
    ]
  }
);
exit();
EOF