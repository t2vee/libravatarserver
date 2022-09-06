require "./initializers/**"

require "form_object"
require "http_method_emulator"
require "flash_container"

require "../src/models/application_record"
require "../src/models/**"

require "../src/email/application_mailer.cr"
require "../src/email/**"

require "../src/form_objects/**"

require "../src/views/application_view"
require "../src/views/**"

require "../src/controllers/application_controller"
require "../src/controllers/*"
