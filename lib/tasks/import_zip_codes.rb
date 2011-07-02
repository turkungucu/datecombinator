require 'csv'

puts "Starting parsing csv file"
count = 0;
CSV.foreach("lib/tasks/zipnov99.csv") do |row|
  zip_code = ZipCode.new
  zip_code.zip = row[0]
  zip_code.latitude = row[1].to_f
  zip_code.longitude = row[2].to_f
  zip_code.city = row[4]
  zip_code_state = row[5]
  zip_code.save
  
  count += 1
  if count % 1000 == 0
    puts "Total rows inserted: #{count}"
  end
end

puts "#{count} rows have been saved"

