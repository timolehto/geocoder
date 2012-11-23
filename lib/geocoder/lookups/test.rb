require 'geocoder/lookups/base'
require 'geocoder/results/test'

module Geocoder
  module Lookup
    class Test < Base

      def self.set_default_stub(results)
        @default_stub = results
      end

      def self.add_stub(query_text, results)
        stubs[query_text] = results
      end

      def self.read_stub(query_text)
        stubs.fetch(query_text) {
          default_stub || raise(ArgumentError, "unknown stub request #{query_text}")
        }
      end

      def self.stubs
        @stubs ||= {}
      end

      def self.reset
        @stubs = {}
      end

      def self.default_stub
        @default_stub
      end

      private

      def results(query)
        Geocoder::Lookup::Test.read_stub(query.text)
      end

    end
  end
end
