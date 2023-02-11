FROM rust:1.67 as builder

RUN cargo new --bin bitcoin-block-reader

WORKDIR ./bitcoin-block-reader
COPY ./Cargo.toml ./Cargo.toml
COPY ./src ./src
RUN cargo build --release

FROM debian:buster-slim
COPY --from=builder /bitcoin-block-reader/target/release/bitcoin-block-reader ./bitcoin-block-reader

CMD ["./bitcoin-block-reader"]
