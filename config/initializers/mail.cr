require "carbon"
require "carbon_smtp_adapter"
require "carbon_sendgrid_adapter"

MAILER_ADAPTER =
  BaseEmail.configure do |settings|
   if LuckyEnv.mailer_type.downcase == "smtp"
     check_smtp_settings
     Carbon::SmtpAdapter.new
     Carbon::SmtpAdapter.configure do |settings|
       settings.host = ENV["SMTP_HOST_URL"]
       settings.port = ENV["SMTP_HOST_PORT"]
       settings.helo_domain = ENV["SMTP_FROM_ADDRESS"]
       settings.use_tls = ENV["SMTP_USE_TLS"]
       settings.username = ENV["SMTP_USER"]
       settings.password = ENV["SMTP_PSSWD"]
     end
   else if LuckEnv.mailer_type.downcase == "sendgrid"
     send_grid_key = send_grid_key_from_env
     Carbon::SendGridAdapter.new(api_key: send_grid_key)
   else
     puts "You must set a valid email provider. Accepted values are 'smtp' and 'sendgrid'"
     exit(1)
   end
  end

private def check_smtp_settings
  if ENV["SMTP_HOST_URL"]? || ENV["SMTP_HOST_PORT"]? || ENV["SMTP_FROM_ADDRESS"]? || ENV["SMTP_USE_TLS"]? || ENV["SMTP_USER"]? || ENV["SMTP_PSSWD"]?
    raise_mising_smtp_message
  end
end

private def send_grid_key_from_env
  ENV["SEND_GRID_KEY"]? || raise_missing_key_message
end

private def raise_missing_smtp_message
  puts "Missing Smtp Details. Make sure to set all smtp variables in the .env. Emails are required for identileaves to function".colorize.red
  exit(1)
end

private def raise_missing_key_message
  puts "Missing SEND_GRID_KEY. Set the SEND_GRID_KEY env variable. Emails are required for identileaves to function".colorize.red
  exit(1)
end
