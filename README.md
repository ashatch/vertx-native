# vertx-native

## Requirements

* [GraalVM](https://www.graalvm.org) 19.0

## Build

`./mvnw package`

or

`docker build -t vertxnative .`

## Run

`./target/vertxnative`

or

`docker run --rm -it --net=host vertxnative`

## How this project was made

1. https://vertx-starter.jetdrone.xyz/#maven
