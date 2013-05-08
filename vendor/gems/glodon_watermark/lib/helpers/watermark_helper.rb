module WatermarkHelper
  # WATERMARK_PRICE_SERVICE = "http://localhost:3000/watermarked_prices"
  # WATERMARK_STRING_SERVICE = "http://localhost:3000/watermarked_strings"
  WATERMARK_PRICE_SERVICE = "http://magicprice.gldjc.com/watermarked_prices"
  WATERMARK_STRING_SERVICE = "http://magicprice.gldjc.com/watermarked_strings"
  def price_image_url(price)
    "#{WATERMARK_PRICE_SERVICE}/#{encrypted(price)}"
  end
  
  def string_image_url(string)
    "#{WATERMARK_STRING_SERVICE}/#{encrypted(string)}"
  end

  private
  require "base64"
  def encrypted(content)
    Base64.encode64(content.to_s)
  end
end

