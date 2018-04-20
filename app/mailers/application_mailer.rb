# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'npage85@gmail.com'
  layout 'mailer'

  private

  def sendgrid_delivery
    mail.delivery_method.settings = Rails.application.secrets.sendgrid_smtp
  end

  def mailgun_delivery
    mail.delivery_method.settings = Rails.application.secrets.amazon_smtp
  end
end
