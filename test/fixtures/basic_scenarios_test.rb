require_relative '../test_helper'

module Minitest
  module Reporters
    module Litr
      class BasicScenarios < Minitest::Test
        def test_successful
          assert true
        end

        def test_equality_failure
          assert_equal 1, 2
        end

        def test_simple_assertion_failure
          assert false
        end

        def test_with_a_diff
          assert_equal "ab\nc", "ab\nd"
        end

        def test_exception
          raise 'A wild exception appears!'
        end

        def test_skipped
          skip 'Because.'
        end
      end
    end
  end
end
