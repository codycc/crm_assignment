require_relative 'contact2.rb'

class CRM
  def print_main_menu
    puts "1. Add a contact"
    puts "2. Update contact"
    puts "3. Display all contacts"
    puts "4. Display contact"
    puts "5. Search By Attribute"
    puts "6. Display contact Attribute"
    puts "7. Delete a contact"
    puts "8. Exit"
  end

  def main_menu
    choice = 0
    while true
      print_main_menu
      choice = gets.chomp.to_i
      choose_option(choice)
    end
  end

  def attributes_menu
    puts "Firstname[1],"
    puts "Lastname[2]"
    puts "Email[3]"
    puts "Note[4]"
  end

  def full_info
        puts "#{contact.id} Full Name:#{contact.full_name} ,Email:(#{contact.email}), Note:(#{contact.note})"
  end

  # def modify_existing_contact
  #   puts "Which contact would you like to modify? Please enter their ID."
  #   contacts_full_name_for_choices
  #   user_id = gets.chomp.to_i
  #   contact = Contact.get(user_id)
  #   puts "Are you sure you would like to modify this contact? (Yes or no)"
  #   answer = gets.chomp.downcase
  #     if answer == "yes"
  #     puts "Would you like to change their;"
  #     attributes_menu
  #     choice = gets.chomp.to_i
  #       case choice
  #       when 1
  #         puts "Please enter new First name "
  #          contact.first_name = gets.chomp.to_s
  #          puts"First name has been changed to #{contact.first_name.capitalize}"
  #       when 2
  #         puts "Please enter new Last name"
  #         contact.last_name = gets.chomp.to_s
  #           puts"Last name has been changed to #{contact.last_name.capitalize}"
  #       when 3
  #         puts "Please enter new email"
  #         contact.email= gets.chomp.to_s
  #           puts"Email has been changed to #{contact.email.capitalize}"
  #       when 4
  #         puts "Please enter new note "
  #         contact.note = gets.chomp.to_s
  #         puts"Note has been changed to #{contact.note.capitalize}"
  #       end
  #     else
  #       puts "\"Yes\" was not selected.. Main menu "
  #     end
  # end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then update
    when 3 then display_all_contacts
    when 4 then display_contact
    when 5 then search_by_attribute
    when 6 then display_contact_attribute
    when 7 then delete_contact
    when 8
      puts "Thanks for using this program!"
      exit
    else
      puts "I'm sorry, I'm afraid you can't do that.Please enter a number between 1-7"
    end
  end

  def add_contact
    puts "Please provide the contact's info:"
    puts "First Name"
    first_name = gets.chomp.to_s.downcase
    puts "Last Name"
    last_name = gets.chomp.to_s.downcase
    puts "Email"
    email = gets.chomp.to_s.downcase
    puts "Note"
    note = gets.chomp.to_s.downcase
    new_contact = Contact.create(first_name, last_name, email,note)
    puts "Contact has been added successfully."
  end

  def display_contact
    puts "Which contact would you like to display? Please enter by ID. "
    contacts_full_name_for_choices
    user_id = gets.chomp.to_i
    contact = Contact.find(user_id)
    puts "Full Name:#{contact.full_name}, Email:(#{contact.email.capitalize}), Note:(#{contact.note.capitalize})"
  end

  def display_all_contacts
    Contact.all.each do |contact|
      puts "#{contact.id} Full Name:#{contact.full_name} ,Email:(#{contact.email}), Note:(#{contact.note})"
    end
  end

  def contacts_full_name_for_choices
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name}"
    end
  end


  def display_contact_attribute
    puts "What contact would you like to display an attribute for? Please enter by ID. "
    contacts_full_name_for_choices
    user_id = gets.chomp.to_i
    contact = Contact.get(user_id)
      puts "Contact found, which attribute would you like to display?"
      attributes_menu
    attribute_id = gets.chomp.to_i
      case attribute_id
        when 1 then puts "The selected contacts first name is: #{contact.first_name.capitalize}"
        when 2 then puts "The selected contacts last name is: #{contact.last_name.capitalize}"
        when 3 then puts "The selected contacts email address is: #{contact.email.capitalize}"
        when 4 then puts "The selected contacts note is: #{contact.note}"
        else
          puts "error"
      end
  end

  def search_by_attribute
  puts "Are you searching by firstname[1], lastname[2], email[3], or note[4] "
  num = gets.chomp.to_i
case num
when 1
  num = "first_name"
when 2
  num = "last_name"
when 3
  num = "email"
when 4
  num = "note"
end
  puts "Value to search for "
  value = gets.chomp
  Contact.search_by_attribute(num,value)
  end

def update
    puts "Which contact would you like to modify? Please enter their ID."
    contacts_full_name_for_choices
    user_id = gets.chomp.to_i
    contact = Contact.get(user_id)
    puts "Would you like to update firstname[1],lastname[2],email[3],or note[4]"
    attribute = gets.chomp.to_i
    case attribute
    when 1 then
      attribute = "first_name"
      puts "Please enter new first name! "
      value =gets.chomp.to_s
    when 2 then
      attribute = "last_name"
      puts "Please enter new last name! "
      value =gets.chomp.to_s
    when 3 then
      attribute = "email"
      puts "Please enter new email"
      value =gets.chomp.to_s
    when 4 then
      attribute = "note"
      puts "Please enter new note"
      value =gets.chomp.to_s
    end
    contact.update(attribute,value)
  end

 def delete_contact
    puts "Which contact would you like to delete? Please enter by ID."
    contacts_full_name_for_choices
    user_id = gets.chomp.to_i
    Contact.get(user_id).delete
  end
 end

crm = CRM.new
crm.main_menu
