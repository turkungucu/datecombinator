require 'csv'

state_map = { '33' => 'NH', '25' => 'MA', '44' => 'RI', '23' => 'ME', 
  '50' => 'VT', '09' => 'CT', '34' => 'NJ', '36' => 'NY', '42' => 'PA',
  '10' => 'DE', '11' => 'DC', '51' => 'VA', '24' => 'MD', '54' => 'WV', 
  '37' => 'NC', '45' => 'SC', '13' => 'GA', '12' => 'FL', '01' => 'AL',
  '47' => 'TN', '28' => 'MS', '21' => 'KY', '39' => 'OH', '18' => 'IN', 
  '26' => 'MI', '19' => 'IA', '55' => 'WI', '27' => 'MN', '46' => 'SD', 
  '38' => 'ND', '30' => 'MT', '17' => 'IL', '29' => 'MO', '20' => 'KS', 
  '31' => 'NE', '22' => 'LA', '05' => 'AR', '40' => 'OK', '48' => 'TX',
  '08' => 'CO', '56' => 'WY', '16' => 'ID', '49' => 'UT', '04' => 'AZ',
  '35' => 'NM', '32' => 'NV', '06' => 'CA', '15' => 'HI', '66' => 'GU',
  '41' => 'OR', '53' => 'WA', '02' => 'AK', '72' => 'PR', '78' => 'VI', 
  '60' => 'AS', '70' => 'PW', '64' => 'FM', '69' => 'MP', '68' => 'MH' }

puts "Start deleting all records in zip_codes"
ZipCode.delete_all
puts "Finished deleting"

puts "Starting parsing csv file"
count = 0;
CSV.foreach("lib/tasks/zipnov99.csv") do |row|
  zip_code = ZipCode.new
  zip_code.zip = row[0]
  zip_code.latitude = row[1].to_f
  zip_code.longitude = row[2].to_f
  zip_code.city = row[4]
  zip_code.state = state_map[row[5]]
  zip_code.save
  
  count += 1
  if count % 1000 == 0
    puts "Total rows inserted: #{count}"
  end
end

puts "#{count} rows have been saved"

