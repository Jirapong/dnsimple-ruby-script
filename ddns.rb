#!/usr/bin/env ruby

require 'open-uri'

token="DOMAIN_TOKEN"
domain_id="DOMAIN_ID"
record_id="RECORD_ID"

jsonip = open('http://jsonip.com').read
if jsonip =~ /(\d+\.\d+\.\d+\.\d+)/
  my_ip = $1
  cmd = "curl -H \"Accept: application/json\""
  cmd << " -H \"Content-Type: application/json\""
  cmd << " -H \"X-DNSimple-Domain-Token: #{token}\""
  cmd << " -X \"PUT\""
  cmd << " -i \"https://api.dnsimple.com/v1/domains/#{domain_id}/records/#{record_id}\""
  cmd << " -d \"{\\\"record\\\":{\\\"content\\\":\\\"#{my_ip}\\\"}}\""
  system(cmd)
end
