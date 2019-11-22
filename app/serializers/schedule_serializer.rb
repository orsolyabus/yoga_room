class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :show_time, :duration, :class_type
end
