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
end
