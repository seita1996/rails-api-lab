module V1
  module Entities
    class AuthorEntity < Grape::Entity
      expose :id
      expose :name
      expose :email
    end
  end
end
