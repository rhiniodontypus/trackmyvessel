#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'

DB = Sequel
  .connect(
  	:adapter => 'mysql2',
  	:user => 'vesseltracker',
  	:host => 'localhost',
  	:database => 'trackmyvessel',
  	:password => 'password'
  )
