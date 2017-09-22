require_relative '../test_helper'
require 'json'

class Minitest::Reporters::LitrTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Minitest::Reporters::Litr::VERSION
  end

  def test_session_start_report
    assert_match JSON.generate(_type: 'session_start', test_number: 6), output
  end

  def test_all_failures_are_displayed
    assert_match '"id":"Minitest::Reporters::Litr::BasicScenarios#test_successful","outcome":"passed"', output
  end

  private

  def output
    @output ||= begin
      fixtures_directory = File.expand_path('../../fixtures', __FILE__)
      test_filename = File.join(fixtures_directory, 'basic_scenarios_test.rb')
      `REPORTER=litr ruby #{test_filename} 2>&1`
    end
  end
end
