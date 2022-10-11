require "../../config/config"

get "/" do
  render "src/views/home.ecr", "src/views/layout/layout.ecr"
end

get "/ChangeAvatar" do
  render "src/views/change.ecr", "src/views/layout/layout.ecr"
end

post "/api/change_avatar/stage/1/send_email" do |env|
  email = env.params.body["email"].as(String)
  if Valid.email? email

     render "src/views/check.ecr", "src/views/layout/layout.ecr"
  end
  render "src/views/change.ecr", "src/views/layout/layout.ecr"
#  if form.valid?
#    email = form.body["email"].as(String)
    #env.redirect "/CheckEmail"
#    render "src/views/check.ecr", "src/views/layout/layout.ecr"
#    next
#  end
#  render "src/views/change.ecr", "src/views/layout/layout.ecr"
end

get "/avatar/:hash" do |env|

end

class Settings
  class_property host : String = "127.0.0.1", port = 3000
end
VERSION = "0.1.0"
Kemal.run
