class SendEmail
  def initialize(recipient_email : String)
    @recipient_email = "noreply@example.com"
  end

  def temp_link(temp_link)
    temp_link_email = EMail::Message.new
    email.from    "noreply@t2v.ch"
    email.to      @recipient_email
    email.subject "Temporary Change Avatar Link"
    email.message_html <<-EOM
          <html>
          <body>
          <img src="cid:logo@identileaves.app">
          <h1>Change your identileaves avatar<h1>
          <p>use the temporary link below to change your avatar through #{ENV["HOSTURL"]} identileaves instance.</p>
    <p>This link will expire in 1 hour.</p>
    <a href="#{temp_link}">#{temp_link}</p>
    <footer>
    2022 @ t2v
    </footer>
    </body>
    </html>
  EOM
    email.message_resource "../../public/Logo.png", cid: "logo@identileaves.app"
    client.start do
      send(temp_link_email)
    end
  end
end
