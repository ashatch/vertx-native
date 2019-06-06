# GraalVM docker image used for AoT compilation
FROM oracle/graalvm-ce:19.0.0 AS build-aot

# Add maven wrapper
ADD mvnw app/
ADD .mvn app/.mvn/

# Add pom and pre-download dependencies
ADD pom.xml app/
WORKDIR /app
RUN ./mvnw verify clean --fail-never

# main build
WORKDIR /
ADD src app/src/
WORKDIR /app
RUN ./mvnw package

# Create new image from debian-slim (20Mb)
FROM debian:stable-slim

COPY --from=build-aot /app/target/vertx-native /vertx-native
COPY --from=build-aot /opt/graalvm-ce-19.0.0/jre/lib/amd64/libsunec.so /libsunec.so

ENTRYPOINT [ "/vertx-native" ]
