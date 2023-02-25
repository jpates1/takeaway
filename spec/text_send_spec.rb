require "text_send"


RSpec.describe TextSend do
  describe "#send_text" do
    it "sends a text confirming the order with an estimated delivery time" do
      fake_client = double(:client)
      fake_message = double(:message, sid: "SM1234567890")
      allow(fake_client).to receive_message_chain(:messages, :create).and_return(fake_message)
      allow(Twilio::REST::Client).to receive(:new).and_return(fake_client)

      #creates a new TextSend instance and call send_text
      phone_number = "+1234567890"
      text_send = TextSend.new(phone_number)
      message_sid = text_send.send_text

      #check that the message contains the expected text and time format
      current_time = Time.now
      delivery_time = (current_time + (45 * 60)).strftime("%H:%M")
      expected_body = "Thank you for your order, it should arrive by #{delivery_time}"
      expect(fake_client.messages).to have_received(:create).with(
        body: expected_body,
        to: phone_number,
        from: ENV["FROM"]
      )
      expect(message_sid).to eq "SM1234567890"
    end
  end
end

