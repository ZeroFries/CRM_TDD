require_relative "Test_helper.rb"

class TestDatabase < Test::Unit::TestCase
	def setup
		@db = Database.new
		@contact = Contacts.new(:last_name => "G", :first_name => "Stu", :email => "sg@sg.com")
	end

	def test_add_contact_adds_contact_to_array
    @db.add(@contact)
    
    assert !@db.contacts.empty?
	end

	def test_adding_existing_contact_does_not_add_to_database
		contact2 = Contacts.new(:last_name => "G", :first_name => "Stu", :email => "sh@sg.com")
		@db.add(@contact)
		@db.add(contact2)

		assert_equal @db.contacts.size, 1
	end

	def test_delete_contact_removes_contact
		@db.add(@contact)
		@db.delete(@contact)

		assert @db.contacts.empty?
	end

	def test_modify_contact_modifies_attribute_to_value
		attribute = :email
		value = "mark@gmail.com"

		@db.modify(@contact, attribute, value)

		assert_equal @contact.email, value
	end

	def test_modify_contact_name_modifies_id
		old_id = @contact.id
		@db.modify(@contact, :first_name, "Jesus")

		refute_equal old_id, @contact.id
	end

	def test_find_contact_by_attribute_finds_contact
		@db.add(@contact)
		value = "Stu"

		assert_equal @db.find_contact(value), [@contact]
	end
end