yaml=YAML.load_file(File.join(::Rails.root, "config", "amqp.yml"))

AMQP_CONN = yaml.fetch(::Rails.env, Hash.new).symbolize_keys

if defined?(PhusionPassenger) # otherwise it breaks rake commands if you put this in an initializer
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    # require 'eventmachine'
    #    require 'amqp'
    if forked
      Rails.logger.info "[AMQP] Initializing amqp..."
      amqp_thread = Thread.new {
        failure_handler = lambda {
          Rails.logger.fatal ("[AMQP] [FATAL] Could not connect to AMQP broker")
        }
        AMQP.start(AMQP_CONN.merge(:on_tcp_connection_failure => failure_handler))
      }
      amqp_thread.abort_on_exception = true
      sleep(0.15)

      EventMachine.next_tick do
        AMQP.channel ||= AMQP::Channel.new(AMQP.connection)

      end
    end
  end
end