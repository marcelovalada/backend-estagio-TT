class Question < ApplicationRecord
  has_one_attached :image

  belongs_to :formulary
  has_many :answers

  enum question_type: [:text, :photo]

  validates :name, uniqueness: { message: 'Nome já está em uso' }

end
