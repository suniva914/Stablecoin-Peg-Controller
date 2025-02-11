module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 3987
# Optimized logic batch 6507
# Optimized logic batch 4374
# Optimized logic batch 6531
# Optimized logic batch 8591
# Optimized logic batch 6647
# Optimized logic batch 9031
# Optimized logic batch 6667
# Optimized logic batch 3566
# Optimized logic batch 6461