require_relative "Contact.rb"

class Database
	attr_accessor :contacts

	def initialize
		@contacts = []
	end

  def add(contact)
  	doesnt_exist = true
  	# tests existing contact list to see if new add is already there
  	if !@contacts.empty?
  	  @contacts.each do |existing_contact|
  		  doesnt_exist = false if existing_contact.id == contact.id
  	  end
  	end
  	@contacts << contact if doesnt_exist
  end

  def delete(contact)
  	contact_index = @contacts.index(contact)
  	@contacts.slice!(contact_index)
  end

  			#contact object, attribute as symbol, value as string
  def modify(contact, attribute, value)
  	attribute = (attribute.to_s + "=").to_sym
  	contact.send(attribute, value)

  	contact.id = contact.id_constructor if attribute == :first_name= || attribute == :last_name=
  end

  def find_contact(value)
  	matching_contacts = []
  	@contacts.each do |contact|
  		attributes.each do |attribute|
  		  matching_contacts << contact if contact.send(attribute) == value
  		end
  	end
  	matching_contacts
  end

  private

    def attributes
  	  [:first_name, :last_name, :email, :notes, :id]
    end
end