FROM node:7.2.0

COPY . /js-xlsx
WORKDIR /js-xlsx

RUN apt-get update && apt-get upgrade unzip

RUN npm install uglify-js -g
RUN npm install mocha -g
RUN npm install

RUN mkdir -p dist
RUN make clean
RUN make all
RUN make dist-deps
RUN make dist

# Run tests with: make test mocha
RUN curl -o test_files.zip -L https://github.com/SheetJS/test_files/releases/download/20170409/test_files.zip
RUN unzip test_files.zip

WORKDIR /js-xlsx/dist
RUN npm link

WORKDIR /js-xlsx/scratch
RUN npm link xlsx