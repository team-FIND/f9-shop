class MessageMailer < ApplicationMailer
  default from: "example@example.com"   # 送信元アドレス
  default to: "find.999.com@gmail.com"     # 送信先アドレス
 
  def received_email(message)
    @message = message
    mail(:subject => 'お問い合わせを承りました')
  end
 
end