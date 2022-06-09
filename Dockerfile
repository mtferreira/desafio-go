FROM golang:alpine3.16 as builder
COPY . /app
WORKDIR /app

RUN go build code-education-rocks.go

FROM hello-world
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT [ "./code-education-rocks" ]