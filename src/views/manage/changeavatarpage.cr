module Views::Manage
  struct ChangeAvatarPage
    include Onyx::HTTP::View

    def initialize(@id_ : String)
    end
    template("../templates/pages/changeavatar.ecr")
    def render_to_text_html(context)
      context.response.content_type = "text/html"
      Kilt.render("../templates/pages/changeavatar.ecr", context.response)
    end
  end
end
