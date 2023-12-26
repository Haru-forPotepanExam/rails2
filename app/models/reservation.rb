class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :start, presence: true
    validates :end, presence: true
    validates :num_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0}
    validate :end_control
    validate :start_control

    def end_control
        errors.add(:end, "はチェックイン日以降の日付を選択してください") unless 
        self.start <= self.end
    end

    def start_control
        errors.add(:start, "は本日以降の日付を選択してください")  if self.start.nil? || self.start < Date.today
    end

end
