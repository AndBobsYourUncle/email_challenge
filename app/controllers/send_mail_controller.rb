# frozen_string_literal: true

class SendMailController < ApplicationController
  def demo_email
    TestMailer.demo_email(email_params[:email], email_params[:subject], email_params[:message]).deliver_now

    render json: {status: 'OK'}
  rescue *SMTP_CLIENT_ERRORS
    # We got an error unrelated to the smtp server going down
    render json: {status: 'The email address supplied is invalid. Please check for spelling mistakes.'}
  rescue *SMTP_SERVER_ERRORS
    # We got an error because the smtp server is down, or there was an auth error
    # Use fallback mailer

    demo_email_fallback
  end

  private

  def demo_email_fallback
    TestMailer.demo_email_fallback(email_params[:email], email_params[:subject], email_params[:message]).deliver_now

    render json: {status: 'OK'}
  rescue *SMTP_SERVER_ERRORS
    # We got an error because the smtp server is down, or there was an auth error
    # We have no other fallback option. Render error

    render json: {status: 'We encountered an internal issue while attempting to deliver this email. Please try again in a few minutes.'}
  end

  def email_params
    params.permit :email, :subject, :message
  end
end
