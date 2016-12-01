require 'date'
require 'erb'

TEMPLATE_FILENAME = 'hamilton.js.erb'

def generate_js(filename: TEMPLATE_FILENAME)
  ERB.new(File.read(filename)).result
end

def get_input(title)
  puts "#{title}:"
  gets.chomp
end

puts "This script will generate code for a chrome bookmarklet to streamline the Chicago Hamilton Lottery."
puts
puts "Please input the following information:"
puts

@first_name = get_input("First Name")
@last_name = get_input("Last Name")
@email = get_input("Email")

birthday = Date.strptime(get_input("Birthday (MM/DD/YYYY)"), "%m/%d/%Y")
@month = birthday.strftime("%m")
@day = birthday.strftime("%d")
@year = birthday.strftime("%Y")

@zip_code = get_input("Zip Code")

puts "======================================"
puts
puts "Next Steps:"
puts "1. Copy the below text"
puts "2. Create or copy an existing bookmark in Chrome"
puts "3. Edit that bookmark and paste the text as the URL"
puts "4. On a desktop, click the bookmark once to go to the lottery page, and again to prepopulated your info"
puts "5. For mobile, head to the lottery page, click on the bookmark once to go to the form, and again to prepopulate it"
puts "6. Click the \"I\'m not a robot\" button and Submit"
puts "7. Save time and money, and if you're lucky, enjoy the show!"
puts
puts generate_js.split.join(" ")
