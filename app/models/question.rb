class Question < ApplicationRecord
  belongs_to :formulary

  validates :name, uniqueness: { message: 'já está em uso' }

end
