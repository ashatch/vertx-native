# GraalVM docker image used for AoT compilation
FROM oracle/graalvm-ce:19.0.0 AS build-aot

# Add maven wrapper
ADD mvnw app/
ADD .mvn app/.mvn/

# Add pom
ADD pom.xml app/

# Add sources
ADD src app/src/

WORKDIR /app
# Build (java side)

RUN ./mvnw package
# Create new image from debian-slim (20Mb)

FROM debian:stable-slim

COPY --from=build-aot /app/target/vertx-native /vertx-native
COPY --from=build-aot /opt/graalvm-ce-19.0.0/jre/lib/amd64/libsunec.so /libsunec.so

ENTRYPOINT [ "/vertx-native" ]
