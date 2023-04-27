# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

ben = Salesperson.find_by({"first_name" => "Ben"})

tim = Contact.find_by({"first_name" => "Tim"})

new_activity = Activity.new
new_activity["notes"] = "Hello. I am Tim Cook."
new_activity["salesperson_id"] = ben["id"]
new_activity["contact_id"] = tim["id"]
new_activity.save

# puts new_activity.inspect

craig = Contact.find_by({"first_name" => "Craig"})


second_activity = Activity.new
second_activity["notes"] = "This is Craig."
second_activity["salesperson_id"] = ben["id"]
second_activity["contact_id"] = craig["id"]
second_activity.save

# puts second_activity.inspect


jeff = Contact.find_by({"first_name" => "Jeff"})


third_activity = Activity.new
third_activity["notes"] = "Amazon is a good company"
third_activity["salesperson_id"] = ben["id"]
third_activity["contact_id"] = jeff["id"]
third_activity.save

# puts third_activity.inspect


forth_activity = Activity.new
forth_activity["notes"] = "Grab lunch soon"
forth_activity["salesperson_id"] = ben["id"]
forth_activity["contact_id"] = tim["id"]
forth_activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

activities = Activity.where({"salesperson_id" => ben["id"], "contact_id" => tim["id"]})

puts "Activities between Ben and Tim Cook:"
for activity in activities
    puts activity["notes"]
end
  

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
