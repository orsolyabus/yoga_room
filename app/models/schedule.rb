class Schedule < ApplicationRecord
  enum class_type: { regular:0, course: 1, workshop: 2}
  validates :start, presence: true  
  validates :duration, numericality: true, if: :duration_needed?
  validates :end, presence: true, if: :end_needed?

  private

  def duration_needed?
    class_type === "regular" || class_type === "course"
  end

  def end_needed?
    class_type === "workshop" || class_type === "course"
  end

end
