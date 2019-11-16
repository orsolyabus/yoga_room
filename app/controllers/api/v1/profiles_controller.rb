class Api::V1::ProfilesController < ApplicationController
  def teachers
    # @teachers = ActiveRecord::Base.connection.exec_query("select users.id, users.name, users.is_teacher,  count(yoga_classes) as class_count From users left join yoga_classes on users.id = yoga_classes.user_id where is_teacher = true group by users.id;")
    # render json: @teachers
  end
end
