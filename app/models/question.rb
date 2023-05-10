class Question < ApplicationRecord
  has_one_attached :image

  belongs_to :formulary

  validates :name, uniqueness: { message: 'já está em uso' }

end
