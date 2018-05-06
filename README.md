# ./jq on Alpine

This image provides a way to run the latest jq version with docker.
 
For example, Make 4 adds the -j flag, which makes it possible to run multiple jobs in parallel:

```
docker run --rm --volume ${PWD}:/app --workdir /app phpqa/jq
```
