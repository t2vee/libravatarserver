module Views::Manage
  struct ChangeAvatarPage
    include Onyx::HTTP::View

    def initialize(@id_ : String)
    end
    template("../templates/pages/sendemail.ecr")
    def render_to_text_html(context)
      context.response.content_type = "text/html"
      Kilt.render("../templates/pages/sendemail.ecr", context.response)
    end
  end
end
