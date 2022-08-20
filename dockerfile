FROM golang:latest as builder

WORKDIR /usr/src/app
COPY codeeducation.go .
RUN go build codeeducation.go 

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/codeeducation . 
ENTRYPOINT ["./codeeducation"]