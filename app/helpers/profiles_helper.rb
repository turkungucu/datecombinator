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
      return zc.city.downcase.split(' ').map {|w| w.capitalize }.join(' ')
    end
  end
  
  # to be used in gender dropdowns
  # ex:
  #  <%= f.select :seeking_gender, options_for_select(gender_list) %>
  def gender_list
    [['Man', 'male'], ['Woman', 'female']]
  end
  
  # converts gender value stored in db to gender label (Man or Woman)
  def to_gender_label(val)
    gender_list.each do |g|
      return g[0] if g[1] == val
    end
  end
  
  # number of characters displayed as profile description on search results
  def desc_char_limit
    340
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
  
  def oldest_birth_year
    1950
  end
  
  def youngest_birth_year
    Date.today.year - 18
  end
  
  # to be used in ethnicity dropdowns
  # ex:
  #  <%= f.select :ethnicity, options_for_select(ethnicity_list) %>
  def ethnicity_list
    [['Black', 'black'], ['Caucasian', 'caucasian'], ['European', 'european'],
     ['Hispanic', 'hispanic'], ['Indian', 'indian'], ['Middle Eastern', 'middle-eastern'],
     ['Native American', 'native-american'], ['Asian', 'asian'], ['Mixed Race', 'mixed-race'],
     ['Other', 'other']]
  end
  
  def ethnicity_list_with_blank
    [['All Ethnicities', '']] | ethnicity_list
  end
  
  def to_ethnicity_label(val)
    ethnicity_list.each do |e|
      return e[0] if e[1] == val
    end
  end
end