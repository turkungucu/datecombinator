module ZipCodesHelper

  RAD_PER_DEG = 0.017453293  #  PI/180

  # the great circle distance d will be in whatever units R is in
  Rmiles = 3956           # radius of the great circle in miles
  
  MILES_PER_DEGREE = 69.17
  
  # Implementation adapted from http://www.esawdust.com/blog/gps/files/HaversineFormulaInRuby.html
  def ZipCodesHelper.haversine_distance_in_miles(lat1, lon1, lat2, lon2)
    dlon = lon2 - lon1
    dlat = lat2 - lat1

    dlon_rad = dlon * RAD_PER_DEG
    dlat_rad = dlat * RAD_PER_DEG

    lat1_rad = lat1 * RAD_PER_DEG
    lon1_rad = lon1 * RAD_PER_DEG

    lat2_rad = lat2 * RAD_PER_DEG
    lon2_rad = lon2 * RAD_PER_DEG

    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

    dMi = Rmiles * c          # delta between the two points in miles
  end
  
  def ZipCodesHelper.miles_btw_zip_codes(zip1, zip2)
    firstZip = ZipCode.find_by_zip(zip1)
    lat1 = firstZip.latitude
    lon1 = firstZip.longitude
    
    secondZip = ZipCode.find_by_zip(zip2)
    lat2 = secondZip.latitude
    lon2 = secondZip.longitude
    
    dist = ZipCodesHelper.haversine_distance_in_miles(lat1, lon1, lat2, lon2)
  end
  
  def ZipCodesHelper.get_nearby_zip_codes(zip, miles)
    result = Array.new
    z = ZipCode.find_by_zip(zip)
    unless zip.nil?
      maxLat = z.latitude + miles / MILES_PER_DEGREE;
      minLat = z.latitude - (maxLat - z.latitude);
      maxLon = z.longitude + miles / (Math.cos(minLat * Math::PI / 180) * MILES_PER_DEGREE);
      minLon = z.longitude - (maxLon - z.longitude);
      
      nearbyZips = ZipCode.find(:all, 
        :conditions => "(latitude BETWEEN #{minLat} AND #{maxLat}) AND 
                        (longitude BETWEEN #{minLon} AND #{maxLon})")
        
      nearbyZips.each do |nz|
        result.push(nz.zip)
      end
    end
    return result
  end
  
end
