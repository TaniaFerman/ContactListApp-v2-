require 'pry'
require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

  print "type help to get the menu: "
  command = gets.chomp   
  if command == "help"
    puts 'new  - Create a new contact'
    puts 'list - List all contacts'
    puts 'show - Show a contact'
    puts 'find - Find a contact'
    print 'type the command that you want: '
    
    command = gets.chomp
    
  case command
  when 'new' then 
    print 'Please type your name: '
    name = gets.chomp
    print 'Please type your email: '
    email = gets.chomp
   
    if Contact.find(email)
      print "the name and email already exist"
    else
    Contact.create(name, email)#, phone)
  end
  #Contact.create(name, email)
  when 'list' then 
    # print 'Please type the id: '
    # id = gets.chomp
    Contact.all
  when 'show' then 
    print 'Please type the id: '
    id = gets.chomp
    Contact.show(id)
  when 'find' then 
    print 'Please type the word to find: '
    word = gets.chomp
    puts Contact.find(word)
  else 
    puts 'Command not recognized'
  end #/case
end

