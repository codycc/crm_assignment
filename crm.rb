require_relative 'contact.rb'


class CRM
  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Display contact"
    puts "5. Display contact attribute"
    puts "6. Delete a contact"
    puts "7. Exit"
  end


  def main_menu
    choice = 0
    while true
      print_main_menu
      choice = gets.chomp.to_i
      choose_option(choice)
    end
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
      puts "Firstname[1],"
      puts "Lastname[2]"
      puts "Email[3]"
      puts "Note[4]"
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
    when 5 then display_contact_attribute
    when 6 then delete_contact
    when 7
      puts "Thanks for using this program!"
      exit
    else
      puts "I'm sorry, I'm afraid you can't do that.Please enter a number between 1-7"
    end
  end

  def add_contact
    puts "Please provide the contact's info:"
    puts "First Name"
    first_name = gets.chomp.to_s
    puts "Last Name"
    last_name = gets.chomp.to_s
    puts "Email"
    email = gets.chomp.to_s
    puts "Note"
    note = gets.chomp.to_s
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
      puts "First name[1]"
      puts "Last name[2]"
      puts "Full name[3]"
      puts "Email[4]"
      puts "Their note[5]"
    attribute_id = gets.chomp.to_i
      case attribute_id
        when 1 then puts "The selected contacts first name is: #{contact.first_name.capitalize}"
        when 2 then puts "The selected contacts last name is: #{contact.last_name.capitalize}"
        when 3 then puts "The selected contacts full name is: #{contact.full_name.capitalize}"
        when 4 then puts "The selected contacts email address is: #{contact.email.capitalize}"
        when 5 then puts "The selected contacts note is: #{contact.note}"
        else
          puts "error"
      end

  end

 def delete_contact
   puts "Which contact would you like to delete? Please enter by ID."
   contacts_full_name_for_choices
   delete_contact = gets.chomp.to_i
   puts "Are you sure you'd like to delete this contact? Please enter yes or no"
   confirmation = gets.chomp.downcase
    if confirmation == "yes"
        Contact.all.each do |user_id|
            if delete_contact == user_id.id
                Contact.all.delete(user_id)
            else
              "error"
            end
        end
        puts"Contact deleted, Main Menu.."
    else
      puts "\"Yes\" was not selected, aborting... main menu.."
      main_menu
    end
 end
 end

crm = CRM.new
crm.main_menu
