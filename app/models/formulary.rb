class Formulary < ApplicationRecord
  has_many :questions
  validates :name, uniqueness: { message: 'Nome já está em uso' }
end
