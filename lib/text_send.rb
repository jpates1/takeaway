require 'twilio-ruby'
require 'dotenv/load'
require 'date'

class TextSend
  
  def initialize(phone_number)
    @account_sid = ENV["TWILIO_ACCOUNT_SID"] # Your Test Account SID from www.twilio.com/console/settings
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]   # Your Test Auth Token from www.twilio.com/console/settings
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @phone_number = phone_number
    @from = ENV["FROM"]
  end

  def send_text
    message = @client.messages.create(
    body: "Thank you for your order, it should arrive by #{time_format}",
    to: @phone_number,    # Replace with your phone number
    from: @from)  # Use this Magic Number for creating SMS
    return message.sid
  end

private

  def time_format
    current_time = Time.now
    time_to_delivery = current_time + (45 * 60)
    time_to_delivery.strftime("%H:%M")
  end

end
