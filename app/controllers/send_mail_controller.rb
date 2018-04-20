# frozen_string_literal: true

class SendMailController < ApplicationController
  def demo_email
    SendDemoEmailWithFallbackJob.perform_later email_params[:email], email_params[:subject], email_params[:message]

    render json: {status: 'OK'}
  end

  private

  def email_params
    params.permit :email, :subject, :message
  end
end
