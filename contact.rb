require 'pg'
require 'pry'

class Contact # first you need to create a new database in the terminal 
    #postgres=# CREATE DATABASE bookstore;

  attr_reader :firstname, :lastname, :email

  CONN = PG::Connection.new({
      host: 'localhost',
      user: 'development',
      password: 'development',
      dbname: 'contact_list'
  })
  puts "CONNECTED"


  def initialize(firstname, lastname, email)
    @firstname = firstname,
    @lastname = lastname,
    @email = email
  end

  def self.save(firstname, lastname, email)
      puts "INSERT"
      CONN.exec_params("INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) returning id;",[firstname, lastname, email])
  end

  def self.find(id)
   puts "Find by id"
   resp = CONN.exec_params("select * from contacts where id = '#{id}'") 
   resp.each { |m| puts m }
  end

  def self.list
    puts "Shows the table"
   resp = CONN.exec_params("select * from contacts") 
   resp.each { |m| puts m }
  end

  def self.find_lastname(lastname)
    puts "Find by lastname"
   resp = CONN.exec_params("select * from contacts where lastname = '#{lastname}'") 
   resp.each { |m| puts m }
  end

  def self.find_firstname(firstname)
    puts "Find by firstname"
   resp = CONN.exec_params("select * from contacts where firstname = '#{firstname}'") 
   resp.each { |m| puts m }
  end

  def self.find_email(email)
    puts "Find by firstname"
   resp = CONN.exec_params("select * from contacts where email = '#{email}'") 
   resp.each { |m| puts m }
  end

  def self.destroy(id)
    puts "Delete"
   resp = CONN.exec_params("DELETE FROM contacts WHERE id = '#{id}'") 
  end
end

#p Contact.new("a", "fer", "e@gmail.com") #for initialize
#p Contact.save("Tania", "Ferman", "tania@gmail.com") 
#p Contact.save("Paty", "Ferman", "paty@gmail.com")
#p Contact.save("Laura", "Ferman", "laura@gmail.com")
#p Contact.save("Grace", "Smith", "grace@gmail.com")
#p Contact.save("Luis", "Lopez", "luis@gmail.com")
#p Contact.save("Carlos", "Perez", "carlos@gmail.com")
#p Contact.save("Mariana", "Reyes", "mariana@gmail.com")
#puts Contact.find(6)
#puts Contact.list
#puts Contact.find_lastname("Lopez")
#puts Contact.find_firstname("Luis")
#puts Contact.find_email("laura@gmail.com")
#puts Contact.destroy(9)
