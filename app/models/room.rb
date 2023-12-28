class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    has_one_attached :img
    attr_accessor :remove_img

    validates :name, presence: true
    validates :fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1}
    validates :address, presence: true
    validates :detail, presence: true

end
