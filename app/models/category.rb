class Category < ApplicationRecord
  has_many :ideas

  validates :name, presence: true, uniqueness: true

  def to_param
    name
  end
end
