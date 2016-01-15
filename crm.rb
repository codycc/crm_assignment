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
       contact.first_name = gets.chomp
    when 2
      puts "Please enter new Last name"
      contact.last_name = gets.chomp
    when 3
      puts "Please enter new email"
      contact.email= gets.chomp
    when 4
      puts "Please enter new note "
      contact.note = gets.chomp
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
      puts "I'm sorry Dave, I'm afraid you can't do that."
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
  end





  def display_contact
    puts "Which Contact would you like to display please enter by id "
    user_id = gets.chomp.to_i
    contact = Contact.find(user_id)
    puts "#{contact.full_name} (#{contact.email}) (#{contact.note})" 
  end


  # def display_contact
  #   puts "Which Contact would you like to display please enter by id "
  #   user_id = gets.chomp.to_i
  #   if user_id == Contact.id
  #     puts "#{contact.full_name}"
  #   else
  #     puts"error"
  #   end
  # end




  def display_all_contacts
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
    end
  end


end

crm = CRM.new
crm.main_menu
