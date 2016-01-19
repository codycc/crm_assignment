
class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id
  @@contacts = []
  @@id = 1

  def initialize(id, first_name, last_name, email,note)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def self.create(first_name, last_name, email,note)
    new_contact = new(@@id, first_name, last_name,email,note) # => Contact.new(...)
    @@contacts << new_contact
    @@id += 1
    new_contact
  end


def self.search_by_attribute (num,value)
   case num
   when "first_name"
        contact = @@contacts.find_all { |contact| contact.first_name == value}
    when "last_name"
        contact = @@contacts.find_all { |contact| contact.last_name == value}
    when "email"
         contact = @@contacts.find_all { |contact| contact.email == value}
    when "note"
        contact = @@contacts.find_all { |contact| contact.note == value}
   end
end



  def update(attribute, value)
    case attribute
    when "first_name"
      @first_name = value
    when "last_name"
      @last_name = value
    when "email"
      @email = value
    when "note"
      @note = value
    end
  end

  def self.all
    @@contacts
  end

  def self.delete_all
  @@contacts = []
  @@id = 1 # Reset id counter to 1
end

  def delete
   Contact.all.delete(self)
 end

  def self.get(id)
    @@contacts.find { |contact| contact.id == id }
  end

  def self.find(id)
    @@contacts.find { |contact| contact.id == id }
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
