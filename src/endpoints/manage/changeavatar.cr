module Endpoints::Manage
  struct ChangeAvatar
    include Onyx::HTTP::Endpoint

    params do
      query do
        type id_ : String = nil
      end
    end

    def call
      if id_ do
        return Views::Manage::ChangeAvatarPage.new(id_)
      else
        return Views::Manage::ChangeAvatarPageInvalid.new
      end
    end
  end
end
