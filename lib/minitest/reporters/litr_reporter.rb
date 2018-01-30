require 'json'

module Minitest
  module Reporters
    # Minitest reporter for litr (https://github.com/Lothiraldan/litr)
    class LitrReporter < BaseReporter
      def start
        super

        print JSON.generate(_type: 'session_start', test_number: total_count)
        print "\n"
      end

      def record(test)
        super
        test_location = location(test)

        # p test.methods.sort if test.skipped?

        print JSON.generate(
          _type: 'test_result', id: identifier(test), outcome: outcome(test), test_name: identifier(test),
          duration: test.time, error: error(test),
          file: test_location[0], line: test_location[1]
        )
        print "\n"
      end

      private

      def location(test)
        test.method(test.name.to_s).source_location
      end

      def error(test)
        failure = test.failures.first
        failure ? Hash[message: failure.message, backtrace: failure.backtrace] : Hash[]
      end

      def identifier(test)
        test.location.gsub(/\s\[(.*)\]/, '')
      end

      def outcome(test)
        return 'skipped' if test.skipped?
        return 'passed' if test.passed?
        return 'error' if test.error?
        return 'failed' if test.failure
      end
    end
  end
end
