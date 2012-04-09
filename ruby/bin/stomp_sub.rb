#!/usr/bin/env ruby

require 'pp'

require 'rubygems'
require 'bundler/setup'

require 'stomp'

STOMP_TCP_PORT = 61613
STOMP_TLS_PORT = 61614

c = Stomp::Client.new('admin', 'password', 'localhost', STOMP_TCP_PORT)

c.subscribe("/queue/test") do |msg|
  pp msg
end
c.join
c.close
