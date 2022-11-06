require "../config/email_config.cr"
require "utils/email.cr"

get "/" do
  render "src/views/index.ecr", "src/views/layout/layout.ecr"
end

get "/ChangeAvatar" do
  render "src/views/changeavatar.ecr", "src/views/layout/layout.ecr"
end

post "/api/changeavatar/sendemail" do |env|
  email = env.params.json["email"].as(String)
  send_temp_link_email(email, temp_email_link)
  render "src/views/checkemail.ecr", "src/views/layout/layout.ecr"
end



get "/avatar/:hash" do |env|
  hash = env.params.url["hash"]
  serve_static env, "#{Kemal.config.public_folder}avatar/#{hash}"
end

error 404 do
  render "src/views/404.ecr"
end

Kemal.run
