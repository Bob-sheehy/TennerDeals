class PurchasedDeal < ActionMailer::Base
  default from: "TennerDeals@gmail.com"
  
  def confirm(order)
    @order = order
    attachments.inline['qrcode.png'] = File.read("#{Rails.root}/app/assets/images/qrcode.png")
    mail to: order.email, subject: 'Deal Purchase from TennerDeals'
  end
  
  def welcome_email(newletter)
    @newsletter = Newsletter
    mail(to: newletter.email, subject: 'Thank you for signing up to Tennerdeals ')
  end
end
