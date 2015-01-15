#!/usr/bin/env python

from livereload import Server, shell

server = Server()
server.watch('E:\ThinkCMFX')
server.serve(port=8080,host='localhost')
