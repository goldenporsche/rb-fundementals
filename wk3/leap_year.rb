def leap_years(start_year, end_year)

  if start_year > end_year
      puts 'Your closing date is before your start date. Please try again'
    return
  end

  leap_years = [] 
  start_year.upto(end_year) do |year|
    if (year % 4 == 0)
      leap_years << year unless (year % 100 == 0) and (year % 400 != 0)
    end
  end
  leap_years
end

puts "This program will find all the leap years between two given years."
puts ''
puts 'Please select a starting year.'
start_year = gets.chomp.to_i
puts ''
puts 'And now select an ending year.'
end_year = gets.chomp.to_i
puts "You chose leap years between #{start_year} and #{end_year}"
puts " "
puts "The leap years between #{start_year} and #{end_year} are as follows:"
puts " "
puts leap_years(start_year, end_year).join(', ')