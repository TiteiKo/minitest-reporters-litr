$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'minitest/reporters'
require 'minitest/reporters/litr'

require 'minitest/autorun'

Minitest::Reporters.use! Minitest::Reporters::LitrReporter.new if ENV['REPORTER'] == 'litr'
