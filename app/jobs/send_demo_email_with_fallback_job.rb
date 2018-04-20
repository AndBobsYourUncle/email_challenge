# frozen_string_literal: true

class SendDemoEmailWithFallbackJob < ApplicationJob
  queue_as :emails

  def perform email, subject, message
    TestMailer.demo_email(email, subject, message).deliver_now
  rescue *SMTP_SERVER_ERRORS
    # We got an error because the smtp server is down, or there was an auth error
    # Use fallback mailer

    email_fallback email, subject, message
  end

  private

  def email_fallback email, subject, message
    TestMailer.demo_email_fallback(email, subject, message).deliver_now
  end
end
