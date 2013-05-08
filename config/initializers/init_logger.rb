if Rails.env == "production"
  Rails.logger = MqLogger.new("rails")
  Rails.logger.level = MqLogger::INFO
end