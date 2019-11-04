class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true
  validates :is_future?, presence: true
  validates :duration, presence:true
  validates :duration_is_multiple_of_5, presence: true
  validates :title,
    presence: true,
    length: { minimum: 5, maximum: 140 }
  validates :description,
    presence: true,
    length: { minimum: 20, maximum: 1000 }
  validates :price,
    presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  def is_future?
    self.start_date > Time.now
  end

  def duration_is_multiple_of_5?
    result = self.duration / 5
    result.is_a? Integer
  end

end