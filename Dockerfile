FROM rust:1.67 as builder

RUN cargo new --bin rust-docker

WORKDIR ./bitcoin-block-reader
COPY ./Cargo.toml ./Cargo.toml
COPY ./src ./src
RUN cargo build --release

FROM debian:buster-slim
COPY --from=builder /rust-docker/target/release/bitcoin-block-reader ./bitcoin-block-reader

CMD ["./rust-docker"]
