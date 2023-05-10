class Visit < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :status, inclusion: { in: %w(pendente realizando realizada), message: 'Só será aceito pendente, realizando ou realizada' }

  validate :before_today?, on: :create
  validate :checkin_before_checkout?, on: :create
  validate :checkin_after_created_at?, on: :create

  private

  def before_today?
    if checkin_at.present? && checkin_at >= Time.zone.today
      errors.add(:checkin_at, "Data de checkin errada! Não deve ser maior ou igual que o dia atual")
    end
  end

  def checkin_before_checkout?
    if checkin_at.present? && checkout_at.present? && checkin_at > checkout_at
      errors.add(:checkin_at, "Não pode ser posterior à data de checkout")
    end
  end

  def checkin_after_created_at?
    if checkin_at.present? && created_at.present? && checkin_at < created_at.to_date
      errors.add(:checkin_at, "Deve ser posterior ou igual à data de criação")
    end
  end
end
