require "onyx/env"
require "onyx/http"

require "sqlite3"
require "onyx/sql"

require "../models"
require "../views"
require "../endpoints"

Onyx::HTTP.on do |r|
  r.get "/" { } # Just a 200 response

end

Onyx::HTTP.listen(
  host: ENV["HOST"]? || "0.0.0.0",
  port: ENV["PORT"]?.try(&.to_i) || 5000
)
