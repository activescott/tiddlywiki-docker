FROM node:alpine

RUN npm install -g tiddlywiki@5.1.22

# The volume is for tiddlywiki data on the host
VOLUME /mnt/wikidata
WORKDIR /mnt/wikidata

# Specifies the TiddlyWiki username/password parameters: https://tiddlywiki.com/#ListenCommand
#ENV TW_USERNAME=${TW_USERNAME}
#ENV TW_PASSWORD=${TW_PASSWORD}

CMD ["/mnt/wikidata/start-tiddlywiki.sh"]

EXPOSE 8000
