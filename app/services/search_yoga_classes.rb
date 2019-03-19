class SearchYogaClasses

  def initialize(params, class_list = YogaClass.all)
    @params = get_search_params(params)
    @class_list = class_list
  end

  def search()

    if @params["keyword"] 
      keyword = "%#{@params["keyword"]}%"
      @class_list = @class_list.where("title ILIKE ? OR description ILIKE ? ", keyword, keyword)  
    end

    if @params["teacher"] 
      teacher_name = "%#{@params["teacher"]}%"
      user = User.includes(:info).where("name ILIKE ? OR spiritual_name ILIKE ? ", teacher_name, teacher_name).references(:info)
      @class_list = @class_list.where(user: user)
    end

    if @params["class_type"]
      schedule = Schedule.where(class_type: @params["class_type"])
      @class_list = @class_list.where(schedule: schedule)
    end

    if @params["day_of_week"]
      day_of_week = @params["day_of_week"]
      schedule = Schedule.where('EXTRACT(dow FROM start) IN (?)', day_of_week)
      @class_list = @class_list.where(schedule: schedule)
    end

    if @params['day_after']
      schedule = Schedule.where('start > ?', Date.parse(@params['day_after']))
      @class_list = @class_list.where(schedule: schedule)
    end

    if @params['day_before']
      schedule = Schedule.where('start < ?', Date.parse(@params['day_before']))
      @class_list = @class_list.where(schedule: schedule)
    end

    if @params["city"]
      location = Location.where(city: @params["city"].capitalize)
      @class_list = @class_list.where(location: location)
    end

    if @params["region"]
      location = Location.where(region: @params["region"].capitalize)
      @class_list = @class_list.where(location: location)
    end

    if @params["country"]
      location = Location.where(country: @params["country"].capitalize)
      @class_list = @class_list.where(location: location)
    end

    if @params["studio"] 
      studio = "%#{@params["studio"]}%"
      location = Location.where("studio ILIKE ?", studio).references(:info)
      @class_list = @class_list.where(location: location)
    end

    @class_list.includes(:location, :schedule).order(created_at: :desc)
  end
  
  private

  def get_search_params(params)
    cleaned_params = clean_params(params)
    search_params = filter_null(cleaned_params)
  end

  def clean_params(params)
    to_reject = ["utf8", "authenticity_token", "action", "controller", "commit"]
    params.reject {|key, val| to_reject.include?(key)}
  end

  def filter_null(params)
    params.reject {|key, val| val===""}
  end

end