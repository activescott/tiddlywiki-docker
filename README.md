# activescott/tiddlywiki-docker

Runs TiddlyWiki in a minimal docker container using simple configuration.

This is intended for quickly and consistently setting up TiddlyWiki for hosting a single user's wiki. 

A few notes:

- Uses [TiddlyWiki's WebServer mode](https://tiddlywiki.com/#WebServer) over a network.
- Requires authentication/authorization (only a single user is supported)
- All configuration that is needed is in the `.env` file.
- Certificates suitable for serving over HTTPS are easily generated with `create-certs.sh`

# Thanks

- Close, but not quite what I wanted: https://github.com/djmaze/tiddlywiki-docker
- Example of mounting volumes to the NAS: https://stackoverflow.com/a/52146393/51061