module V1
  module Entities
    class PostEntity < Grape::Entity
      expose :id
      expose :title
      expose :omitted_content do |post|
        post.truncated_content
      end
      expose :content
      expose :author, using: V1::Entities::AuthorEntity
    end
  end
end
