class OrderMailer < ActionMailer::Base
  default from: "no-reply@konsalta.abardacha.ru"

  # params: phone, email, username
  def konsalt_mail params
    build_params params
    send_email t('emails.konsalta_mail.subject')
  end

  #params: phone, username
  def call_mail params
    build_params params
    send_email t('emails.call_mail.subject')
  end

private
  def send_email subject
    mail(to: 'konstantin@konsalta.com', subject: subject)
  end

  def build_params params
    @username = params[:username]
    @phone = params[:phone]
    @email = params[:email]
    @created_at = params[:created_at]
  end
end
