class Post < ApplicationRecord

  default_scope { order(created_at: :desc) }

  validates :body, presence: true, allow_blank: false
  validates :username, presence: true

end
