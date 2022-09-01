require "onyx/env"
require "onyx/http"

require "sqlite3"
require "onyx/sql"
require "../models"
require "../views"
require "../endpoints"

Onyx::HTTP.on do |r|
  r.get "/" { } # Just a 200 response

  r.on "/avatar" do
    r.get "/", Endpoints::Avatars::CheckAvatar
    r.get "/:emailhash", Endpoints::Avatars::ServeImage
  end

  r.on "/Manage" do
    r.get "/SendEmail", Endpoints::Manage::SendEmail
    r.post "/SendEmail" , Endpoints::Manage::SendVerificationEmail
    r.get "/ChangeAvatar", Endpoints::Manage::ChangeAvatar
  end
end

Onyx::HTTP.listen(
  host: ENV["HOST"]? || "0.0.0.0",
  port: ENV["PORT"]?.try(&.to_i) || 5000
)
