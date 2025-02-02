.DEFAULT_GOAL := init

init:
	cd scripts && bash init-config.sh && sleep 2 && \
	bash init-shards.sh && sleep 2 && \
	bash init-router.sh && sleep 2 && \
	bash check-shards.sh

check:
	cd scripts && bash check-shards.sh