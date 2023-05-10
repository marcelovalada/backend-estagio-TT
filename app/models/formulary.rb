class Formulary < ApplicationRecord
  validates :name, uniqueness: { message: 'já está em uso' }
end
