require 'http'


HOST = 'http://rest.qa.innodealing.com/'.freeze
res = false
user = 000000
bond_id = 0000000000

Given(/ID = (.*), BOND = (.*)/) do |id, bond|
  puts "Prepare data, id = #{id}, bond = #{bond}"
  user = id
  bond_id = bond
end

When(/I request API '(.*)'/) do |uri|
  request_path = HOST + uri.gsub('ID', user)
  puts "req.path: %s, \n req.body: %s" % [request_path, bond_id]
  res = HTTP.headers("Content-Type" => "application/json")
            .post(request_path, :json => {:bondIds => [bond_id]})
  puts "res.code: %s \n res.body: %s \n res.content_type: %s" % [res.code, res.body, res.content_type]
end

Then(/code is '(.*)', message is '(.*)'/) do | code, message|
  puts "code: #{code}, message: #{message}"
  expect(res.code).to eq(code.to_i)
  # expect(res.body).to eq(message)
end
