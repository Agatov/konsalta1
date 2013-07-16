class Order < ActiveRecord::Base
  attr_accessible :email, :phone, :username

  #after_create :send_notification

private
  def send_notification
    response = HTTParty.get(
        'http://api.sms24x7.ru',
        query: {
            method: 'push_msg',
            email: 'agatovs@gmail.com',
            password: 'avv6rqE',
            phone: '79629186985',
            text: get_sms,
            sender_name: 'Konsalta'
        }
    )
  end
    
  def get_sms
    I18n.translate(
        'sms.sms_text',
        username: username,
        phone: phone,
        date: Russian.strftime(created_at, '%d %b, %H:%M')
    )
  end
end
