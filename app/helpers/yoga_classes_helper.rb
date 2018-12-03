module YogaClassesHelper

  def search_this(list, full_params)
    params = get_search_params(full_params)
    # puts params
    query = list

    if params["keyword"] # add multiple words search
      # puts params
      search = "%#{params["keyword"]}%"
      query = query.where("title ILIKE ? OR description ILIKE ? ", search, search)  
    end

    if params["teacher"] 
      # puts params
      search = "%#{params["teacher"]}%"
      user = User.includes(:info).where("name ILIKE ? OR spiritual_name ILIKE ? ", search, search).references(:info)
      query = query.where(user: user)
    end

    if params["class_type"]
      # puts params
      schedule = Schedule.where(class_type: params["class_type"])
      query = query.where(schedule: schedule)
    end

    if params["day_of_week"]
      # puts params
      search = params["day_of_week"]
      schedule = Schedule.where('EXTRACT(dow FROM start) IN (?)', search)
      query = query.where(schedule: schedule)
    end

    if params['day_after']
      # puts params
      schedule = Schedule.where('start > ?', Date.parse(params['day_after']))
      query = query.where(schedule: schedule)
    end

    if params['day_before']
      # puts params
      schedule = Schedule.where('start < ?', Date.parse(params['day_before']))
      query = query.where(schedule: schedule)
    end

    if params["city"]
      # puts params
      location = Location.where(city: params["city"].capitalize)
      query = query.where(location: location)
    end

    if params["state"]
      # puts params
      location = Location.where(state: params["state"].capitalize)
      query = query.where(location: location)
    end

    if params["country"]
      # puts params
      location = Location.where(country: params["country"].capitalize)
      query = query.where(location: location)
    end

    if params["studio"] 
      # puts params
      search = "%#{params["studio"]}%"
      location = Location.where("studio ILIKE ?", search).references(:info)
      query = query.where(location: location)
    end

    query
  end
  
  private

  def get_search_params(params)
    cleaned_params = clean_params(params)
    search_params = filter_null(cleaned_params)
  end

  def clean_params(params)
    # puts params
    to_reject = ["utf8", "authenticity_token", "action", "controller", "commit"]
    params.reject {|key, val| to_reject.include?(key)}
  end

  def filter_null(params)
    params.reject {|key, val| val===""}
  end

end
