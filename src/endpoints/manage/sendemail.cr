module Endpoints::Manage
  struct SendEmail
    include Onyx::HTTP::Endpoint
    def call
      return Views::Manage::SendEmailPage.new()
    end
  end
end
