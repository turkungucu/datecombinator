module ProfilesHelper
  # calculate age given date of birth
  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
  
  # get the name of the city that given zipcode belongs to
  def city_from_zip(zip)
    zc = ZipCode.find_by_zip(zip)
    if zc.nil?
      return ""
    else
      return zc.city
    end
  end
  
  # to be used in gender dropdowns
  # ex:
  #  <%= f.select :seeking_gender, options_for_select(gender_list) %>
  def gender_list
    [['Male', 'male'], ['Female', 'female']]
  end
  
  # number of characters displayed as profile description on search results
  def desc_char_limit
    350
  end
  
  # returns all numbers 18 through 99
  def age_range
    18..99
  end
  
  # to be used in within zipcode dropdowns
  # ex:
  #  <%= select_tag(:within, options_for_select(distance_list)) %>
  def distance_list
    [['5 miles', '5'], ['10 miles', '10'], ['15 miles', '15'], 
     ['25 miles', '25'], ['35 miles', '35'], ['50 miles', '50'],
     ['75 miles', '75'], ['100 miles', '100']]
  end
end
