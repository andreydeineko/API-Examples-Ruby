#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'CHANGE_THIS'
SERVICE_KEY = 'CHANGE_THIS'

ENDPOINT = 'https://events.pagerduty.com/generic/2010-04-15/create_event.json'
TOKEN_STRING = "Token token=#{API_TOKEN}"

data = {
  service_key: SERVICE_KEY,
  incident_key: 'srv01/HTTP',
  event_type: 'resolve',
  description: 'Andrew fixed the problem.',
  details: '2010-06-10 06:00'
}

response = HTTParty.post(
  ENDPOINT,
  body: data.to_json,
  headers: {
    'Content-Type' => 'application/json', 'Authorization' => TOKEN_STRING
  }
)

puts response.body
