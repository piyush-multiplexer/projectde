class Verification < ApplicationRecord

  def send_pin
    response = HTTParty.get("whtever api for sending otp")
    if response['Status'].equal?('Success')
      $session_id = response['Details']
    end
  end

  def verify(entered_pin)
    response = HTTParty.get("whatever api otp verification")
    update(verified: true) if response['Status'].eql?("Success")
  end


end
