FROM node:alpine

RUN npm install -g tiddlywiki@5.1.22

# The volume is for tiddlywiki data on the host
VOLUME /mnt/wikidata
WORKDIR /mnt/wikidata

ADD docker-lib/start-tiddlywiki.sh /usr/local/lib/tiddlywiki/start-tiddlywiki.sh
CMD ["/usr/local/lib/tiddlywiki/start-tiddlywiki.sh"]

EXPOSE 8000
