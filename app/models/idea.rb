class Idea < ApplicationRecord
  belongs_to :category

  with_options presence: true do
    validates :category_id
    validates :body
  end

  def to_param
    name
  end
end