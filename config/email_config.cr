config = EMail::Client::Config.new("mail.t2v.ch", 465, helo_domain: "noreply@t2v.ch")
config.use_tls(TLSMode::STARTTLS)
config.use_auth("sys@t2v.ch", "")
config.name = "identileaves"
config.on_failed = EMail::Client::OnFailedProc.new do |mail, command_history|
  puts mail.data
  puts ""
  puts command_history.join("\n")
end
config.on_fatal_error = EMail::Client::OnFatalErrorProc.new do |error|
  puts error
end
client = EMail::Client.new(config)
