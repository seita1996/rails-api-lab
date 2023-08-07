class Post < ApplicationRecord
  belongs_to :author

  def truncated_content
    return "#{content.slice(0..9)}..." if content.length > 10

    content
  end
end
