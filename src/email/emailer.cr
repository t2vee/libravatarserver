abstract class ApplicationMailer < Carbon::Email
  getter email_subject : String, email_address : String

  from Carbon::Address.new(ENV["SMTP_SENDER_NAME"], ENV["SMTP_FROM_ADDRESS"])
  to email_address
  subject email_subject
  settings.adapter = Carbon::SmtpAdapter.new #MAILER_ADAPTER

  def initialize
    @email_address = ""
    @email_subject = ""
  end

  macro html_template
    def html_body
      Kilt.render ""
    end
  end
end
