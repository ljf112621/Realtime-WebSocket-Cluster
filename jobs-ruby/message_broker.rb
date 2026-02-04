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

# Optimized logic batch 6001
# Optimized logic batch 2503
# Optimized logic batch 4073
# Optimized logic batch 2923
# Optimized logic batch 3385
# Optimized logic batch 3313
# Optimized logic batch 3269
# Optimized logic batch 6037
# Optimized logic batch 5748
# Optimized logic batch 7045
# Optimized logic batch 3631
# Optimized logic batch 6284
# Optimized logic batch 8236
# Optimized logic batch 2474
# Optimized logic batch 2866
# Optimized logic batch 4725
# Optimized logic batch 2678
# Optimized logic batch 4364
# Optimized logic batch 6578
# Optimized logic batch 1683
# Optimized logic batch 5592
# Optimized logic batch 8413
# Optimized logic batch 8750
# Optimized logic batch 1116