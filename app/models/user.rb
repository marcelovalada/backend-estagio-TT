class User < ApplicationRecord
  has_many :visits
  #método do bcrypt para garantir que a senha esteja criptografada
  #has_secure_password

  # Validações de presença
  validates :name, :email, :cpf, presence: true

  # Validação de senha com pelo menos 6 caracteres
  validates :password_digest, length: { minimum: 6 }

  # Validação de formato de CPF válido
  validates :cpf, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: 'deve estar no formato 999.999.999-99' }

  # Validação de CPF único
  validates :cpf, uniqueness: { message: 'já está em uso' }, on: :create

  # Validação de e-mail único
  validates :email, uniqueness: { message: 'já está em uso' }, on: :create
end
