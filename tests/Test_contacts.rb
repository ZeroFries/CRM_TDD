require_relative "Test_helper.rb"

class TestContacts < Test::Unit::TestCase
	def setup
		@contact = Contacts.new(:first_name, "Stu", :last_name, "G", :email, "sg@sg.com")
	end

	def test_contact_has_parameters
		assert_equal @contact.first_name, "Stu"
		assert_equal @contact.last_name, "G"
		assert_equal @contact.email, "sg@sg.com"
		assert_equal @contact.notes, ""
	end
end