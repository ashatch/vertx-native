# vertx-native

## Requirements

* [GraalVM](https://www.graalvm.org) 19.0

## Build

`./mvnw package`

or

`docker build -t vertx-native .`

## Run

`./target/vertx-native`

or

`docker run --rm -it --net=host vertx-native`

## How this project was made

1. https://vertx-starter.jetdrone.xyz/#maven
