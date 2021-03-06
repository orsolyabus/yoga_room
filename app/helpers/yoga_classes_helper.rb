module YogaClassesHelper

  def search_this(list, full_params)
    params = get_search_params(full_params)
    query = list

    if params["keyword"] # add multiple words search
      search = "%#{params["keyword"]}%"
      query = query.where("title ILIKE ? OR description ILIKE ? ", search, search)  
    end

    if params["teacher"] 
      search = "%#{params["teacher"]}%"
      user = User.includes(:info).where("name ILIKE ? OR spiritual_name ILIKE ? ", search, search).references(:info)
      query = query.where(user: user)
    end

    if params["class_type"]
      schedule = Schedule.where(class_type: params["class_type"])
      query = query.where(schedule: schedule)
    end

    if params["day_of_week"]
      search = params["day_of_week"]
      schedule = Schedule.where('EXTRACT(dow FROM start) IN (?)', search)
      query = query.where(schedule: schedule)
    end

    if params['day_after']
      schedule = Schedule.where('start > ?', Date.parse(params['day_after']))
      query = query.where(schedule: schedule)
    end

    if params['day_before']
      schedule = Schedule.where('start < ?', Date.parse(params['day_before']))
      query = query.where(schedule: schedule)
    end

    if params["city"]
      location = Location.where(city: params["city"].capitalize)
      query = query.where(location: location)
    end

    if params["region"]
      location = Location.where(region: params["region"].capitalize)
      query = query.where(location: location)
    end

    if params["country"]
      search = params["country"]
      location = Location.where("country ILIKE ? ", search)
      query = query.where(location: location)
    end

    if params["studio"] 
      search = "%#{params["studio"]}%"
      location = Location.where("studio ILIKE ?", search).references(:info)
      query = query.where(location: location)
    end

    query.includes(:location, :schedule).order(created_at: :desc)
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
