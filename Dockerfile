# Set defaults

ARG BASE_IMAGE="alpine:3.7"
ARG VERSION="1.5"

# Build image

FROM ${BASE_IMAGE}
ARG VERSION
ARG INTERNAL_TAG
ARG BUILD_DATE
ARG VCS_REF

# Install Tini - https://github.com/krallin/tini

RUN apk add --no-cache tini

# Install jq - https://stedolan.github.io/jq/

RUN apk add --no-cache "jq=~${VERSION}"

# Add entrypoint script

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Add image labels

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="phpqa" \
      org.label-schema.name="jq" \
      org.label-schema.version="${INTERNAL_TAG}" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.url="https://github.com/phpqa/jq" \
      org.label-schema.usage="https://github.com/phpqa/jq/README.md" \
      org.label-schema.vcs-url="https://github.com/phpqa/jq.git" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.docker.cmd="docker run --rm --volume \${PWD}:/app --workdir /app phpqa/jq:${INTERNAL_TAG}"

# Package container

WORKDIR "/app"
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["jq"]

