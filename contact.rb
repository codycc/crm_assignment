class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id
  @@contacts = []
  @@id = 1

  def initialize(id, first_name, last_name, options = {})
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = options[:email]
    @note = options[:note]
  end

  def self.create(first_name, last_name, options = {})
    new_contact = new(@@id, first_name, last_name, options) # => Contact.new(...)
    @@contacts << new_contact
    @@id += 1
    new_contact
  end

  def self.all
    @@contacts
  end

  def self.delete(user_id)
  @@contacts.delete_if { |contact| contact.id == user_id}
  end

  def self.find(id)
    @@contacts.find { |contact| contact.id == id }
  end


  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
