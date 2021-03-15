# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/newrelic-ruby-agent/blob/main/LICENSE for complete details.

require 'new_relic/agent/datastores'
require 'new_relic/agent/datastores/redis'

require_relative 'redis/chain'
require_relative 'redis/prepend'
require_relative 'redis/redis_instrumentation'

DependencyDetection.defer do
  # Why not :redis? newrelic-redis used that name, so avoid conflicting
  named :redis_instrumentation

  depends_on do
    defined? ::Redis::VERSION
  end

  depends_on do
    NewRelic::Agent.config[:disable_redis] == false
  end

  depends_on do
    NewRelic::Agent::Datastores::Redis.is_supported_version? &&
      NewRelic::Agent::Datastores::Redis.safe_from_third_party_gem?
  end

  executes do
    NewRelic::Agent.logger.info 'Installing Redis Instrumentation'
    if use_prepend?
      prepend_instrument ::Redis::Client, NewRelic::Agent::Instrumentation::Redis::Prepend
    else
      chain_instrument NewRelic::Agent::Instrumentation::Redis::Chain

    end

  end
end
