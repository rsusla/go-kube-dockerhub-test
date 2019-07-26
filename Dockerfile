FROM golang:latest
MAINTAINER Raman Susla <catmorte@gmail.com>
RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . /go/src/app
EXPOSE 8081
CMD ["./main"]