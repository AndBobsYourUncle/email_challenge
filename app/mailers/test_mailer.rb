# frozen_string_literal: true

class TestMailer < ApplicationMailer
  after_action :sendgrid_delivery, only: [:demo_email]
  after_action :mailgun_delivery, only: [:demo_email_fallback]

  def demo_email(email, subject, message)
    @message = message
    mail(to: email, subject: subject)
  end

  def demo_email_fallback(email, subject, message)
    @message = message
    mail(to: email, subject: subject)
  end
end
