require 'simplecov'
SimpleCov.start 'test_frameworks'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'okex/api'
require 'minitest/autorun'

module TestHelper
  
end

def assert_success_response(response)
  assert_equal %w[success result], response.keys
  assert_equal true, response['success']
end

def assert_hash_has_keys(response, keys)
  assert keys.all? { |i| response.keys.include? i }
end

def assert_hash_to_include(expected_data, data)
  assert_instance_of Hash, data
  assert_equal expected_data, expected_data.keys.map{|k| [k, data[k]] }.to_h
end