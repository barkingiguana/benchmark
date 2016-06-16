require "barking_iguana/benchmark/version"

module BarkingIguana
  module Benchmark
    def self.included into
      into.include InstanceMethods
    end

    module InstanceMethods
      private
      def benchmark message, options = {}
        start_at = Time.now
        log_level = options[:level] || :info
        logger.public_send(log_level) do
          "Starting block: #{message}"
        end
        return_value = yield
        logger.public_send(log_level) do
          "Finished block in #{Time.now - start_at}s: #{message}"
        end
        return_value
      end
    end
  end
end
