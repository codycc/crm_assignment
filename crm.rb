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
    puts "Which contact would you like to modify? Please enter their id"
    user_id = gets.chomp.to_i
    contact = Contact.find(user_id)
    puts contact
    puts "Would you like to change their firstname[1],lastname[2],email[3],or note[4] "
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
      puts"Email has been changed to #{contact.note.capitalize}"
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
      puts "Thanks for playing!"
      exit
    else
      puts "I'm sorry, I'm afraid you can't do that."
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
    puts "Which Contact would you like to display please enter by id "
    display_all_contacts
    user_id = gets.chomp.to_i
    contact = Contact.find(user_id)
    puts "#{contact.full_name.capitalize} (#{contact.email.capitalize}) (#{contact.note.capitalize})"
  end


  def display_all_contacts
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
    end
  end

  def display_contact_attribute
    puts "What contact would you like to display an attribute for? Please enter by id "
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
        when 1 then puts "The selected contacts first name is #{contact.first_name.capitalize}"
        when 2 then puts "The selected contacts last name is #{contact.last_name.capitalize}"
        when 3 then puts "The selected contacts full name is #{contact.full_name.capitalize}"
        when 4 then puts "The selected contacts email address is #{contact.email.capitalize}"
        when 5 then puts "The selected contacts note is #{contact.note}"
        else
          puts "error"
      end

  end

 def delete_contact
   puts "Which contact would you like to delete enter by id"
   delete_contact = gets.chomp.to_i
   puts "Are you sure? Please enter yes or no"
   confirmation = gets.chomp.downcase
    if confirmation == "yes"
        Contact.all.each do |user_id|
            if delete_contact == user_id.id
                Contact.all.delete(user_id)
            else
              "error"
            end
        end
        puts"Contact deleted, main menu.."
    else
      puts "\"Yes\" was not selected, aborting... main menu.."
      main_menu
    end
 end
 end

crm = CRM.new
crm.main_menu
