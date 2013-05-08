class MqLogger < Logger
  
  module Level
    DEBUG = 0
    INFO = 1
    WARN = 2
    ERROR = 3
    FATAL = 4
    UNKNOWN = 5
  end
  
  
  def add(severity, message = nil, progname = nil, &block)
    severity ||= UNKNOWN
    if severity < @level
      return true
    end
    progname ||= @progname
    if message.nil?
      if block_given?
        message = yield
      else
        message = progname
        progname = @progname
      end
    end
    
    send_message_to_amqp(message)
    true
  end
  
  def send_message_to_amqp(log)
    
    if AMQP.channel
      AMQP.channel.direct("glodon.rails", :durable => true, :persistent => true).publish(log, :routing_key => "glodon.tmd.log")
    else
      p log.strip
    end
  end
end