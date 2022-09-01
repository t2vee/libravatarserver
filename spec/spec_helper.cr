require "spec"
require "../src/identileaves"

BaseEmail.configure do |settings|
  settings.adapter = Carbon::DevAdapter.new(print_emails: true)
end
