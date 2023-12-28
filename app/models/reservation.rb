class Reservation < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :room


    validates :start_at, presence: true
    validates :end_at, presence: true
    validates :num_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0}
    validate :end_control
    validate :start_control

    def start_control
        errors.add(:start_at, "は本日以降の日付を選択してください")  if self.start_at.nil? || self.start_at < Date.today
    end

    def end_control
        if self.start_at.present? && self.end_at.present?
            errors.add(:end_at, "はチェックイン日以降の日付を選択してください") unless self.start_at <= self.end_at
        end
    end
end
