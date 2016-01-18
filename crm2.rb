require_relative 'contact2.rb'

class CRM
  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
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

  def modify_existing_contact
    puts "Which contact would you like to modify? Please enter their ID."
    contacts_full_name_for_choices
    user_id = gets.chomp.to_i
    contact = Contact.find(user_id)
    puts "Are you sure you would like to modify this contact? (Yes or no)"
    answer = gets.chomp.downcase
      if answer == "yes"
      puts "Would you like to change their;"
      attributes_menu
      choice = gets.chomp.to_i
        case choice
        when 1
          puts "Please enter new First name "
           contact.first_name = gets.chomp.to_s
           puts"First name has been changed to #{contact.first_name.capitalize}"
        when 2
          puts "Please enter new Last name"
          contact.last_name = gets.chomp.to_s
            puts"Last name has been changed to #{contact.last_name.capitalize}"
        when 3
          puts "Please enter new email"
          contact.email= gets.chomp.to_s
            puts"Email has been changed to #{contact.email.capitalize}"
        when 4
          puts "Please enter new note "
          contact.note = gets.chomp.to_s
          puts"Note has been changed to #{contact.note.capitalize}"
        end
      else
        puts "\"Yes\" was not selected.. Main menu "
      end
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then modify_existing_contact
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
    new_contact = Contact.create(first_name, last_name, email: email, note: note)
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
    contact = Contact.find(user_id)
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
  puts "Please enter a search request: "
  attribute_selection = gets.chomp.to_s
  Contact.search_by_attribute(attribute_selection)
end

  # def search_by_attribute
  # puts "Would you like to search by [1]Firstname, [2]Lastname, [3]Full name, [4]Email or [5]note?"
  # answer = gets.chomp.to_i
  # case answer
  # when 1
  #     puts "Please enter first name of person"
  #     first_name = gets.chomp.to_s.downcase
  #     contact = Contact.get_by_firstname(first_name)
  #     puts "#{contact.id} Full Name:#{contact.full_name} ,Email:(#{contact.email}), Note:(#{contact.note})"
  #   when 2
  #     puts "Please enter last name of person"
  #     last_name = gets.chomp.to_s.downcase
  #     contact = Contact.get_by_lastname(last_name)
  #     puts "#{contact.id} Full Name:#{contact.full_name} ,Email:(#{contact.email}), Note:(#{contact.note})"
  #   when 3
  #     puts "Please enter first name of person"
  #     first_name = gets.chomp.to_s.downcase
  #     puts "Please enter last name of person"
  #     last_name = gets.chomp.to_s.downcase
  #     contact = Contact.get_by_full_name(first_name,last_name)
  #       puts "#{contact.id} Full Name:#{contact.full_name} ,Email:(#{contact.email}), Note:(#{contact.note})"
  #   when 4
  #     puts "Please enter the email of desired person"
  #     email = gets.chomp.downcase
  #     contact = Contact.get_by_email(email)
  #       puts "#{contact.id} Full Name:#{contact.full_name} ,Email:(#{contact.email}), Note:(#{contact.note})"
  #   when 5
  #     puts "Please enter the note of desired person"
  #     note = gets.chomp.downcase
  #     contact = Contact.get_by_note(note)
  #       puts "#{contact.id} Full Name:#{contact.full_name} ,Email:(#{contact.email}), Note:(#{contact.note})"
  #   else
  #     puts "Please enter 1 2 or 3"
  #   end
  # end


 def delete_contact
   puts "Which contact would you like to delete? Please enter by ID."
   contacts_full_name_for_choices
   user_id = gets.chomp.to_i
   puts "Are you sure you'd like to delete this contact? Please enter yes or no"
   confirmation = gets.chomp.downcase
    if confirmation == "yes"
          Contact.delete(user_id)
        puts"Contact deleted, Main Menu.."
    else
      puts "\"Yes\" was not selected, aborting... main menu.."
    end
 end
 end

crm = CRM.new
crm.main_menu
