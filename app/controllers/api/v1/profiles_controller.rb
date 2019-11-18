class Api::V1::ProfilesController < ApplicationController
  def teachers
    @teachers = ActiveRecord::Base.connection.select_all("
      SELECT profiles.id, profiles.name, profiles.intro, profiles.image_url, COUNT(yoga_classes) AS class_count 
      FROM profiles 
      LEFT JOIN yoga_classes ON profiles.id = yoga_classes.profile_id 
      WHERE is_teacher = true 
      GROUP BY profiles.id;
    ")
    render json: @teachers
  end
end
