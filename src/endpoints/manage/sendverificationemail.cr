require "carbon"
require "dotenv"
require "carbon_smtp_adapter"

Dotenv.load ".env"

abstract class BaseEmail < Carbon::Email
  from Carbon::Address.new(ENV["SMTP_SENDER_NAME"], ENV["SMTP_FROM_ADDRESS"])
  macro inherited
    from default_from
    layout :application_layout
  end
end

BaseEmail.configure do |setting|
  settings.adapter = Carbon::SmtpAdapter.new
end

Carbon::SmtpAdapter.configure do |settings|
  settings.host = ENV["SMTP_HOST_URL"]
  settings.port = ENV["SMTP_HOST_PORT"]
  settings.use_tls = ENV["SMTP_USE_TLS"]
  settings.username = ENV["SMTP_USER"]
  settings.password = ENV["SMTP_PSSWD"]
end

class VerifyEmail < BaseEmail
  def initialize(@email_address : String)
  end

  to @email_address
  subject "Change Avatar Link"
  reply_to "noreply@" + ENV["SMTP_SENDER_NAME"]
  templates html

end

module Endpoints::Manage
  struct SendVerificationEmail
    include Onyx::HTTP::Endpoint

    def call
      VerifyEmail.new("email@email.com").deliver
    end
  end
end
