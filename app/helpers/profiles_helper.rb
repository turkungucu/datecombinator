module ProfilesHelper
  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
  
  def cityFromZip(zip)
    zc = ZipCode.find_by_zip(zip)
    if zc.nil?
      return ""
    else
      return zc.city
    end
  end
end
