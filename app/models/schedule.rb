class Schedule < ApplicationRecord
  belongs_to :yoga_class

  enum class_type: { regular:0, course: 1, workshop: 2}
  validates :class_type, presence: true 
  validates :start, presence: true  
  validates :duration, numericality: true, if: :duration_needed?
  validates :end, presence: true, if: :end_needed?
  validate :end_is_grater_than_start, if: :end_needed?
  validate :start_must_be_future
  # regular classes: start, duration
  # course : start end duration
  # workshop: start, end

  private

  def duration_needed?
    class_type === "regular" || class_type === "course"
  end

  def end_needed?
    class_type === "workshop" || class_type === "course"
  end

  def start_must_be_future
    if start.past?
      errors.add(:start, "start date must be in the future")
    end
  end

  def end_is_grater_than_start
    if start > self.end
      errors.add(:end, "end date momst be later than start date")
    end
  end
end
