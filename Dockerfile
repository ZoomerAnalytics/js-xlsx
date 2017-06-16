FROM node:7.2.0

COPY . /js-xlsx
WORKDIR /js-xlsx

RUN npm install uglify-js -g
RUN npm install

RUN mkdir -p dist
RUN make clean
RUN make all
RUN make dist-deps
RUN make dist

WORKDIR /js-xlsx/dist
RUN npm link

WORKDIR /js-xlsx/scratch
RUN npm link xlsx