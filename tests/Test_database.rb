require_relative "Test_helper.rb"

class TestDatabase < Test::Unit::TestCase
	def setup
		@db = Database.new
	end

	def test_add_contact_adds_contact_to_array
    @db.add(@contact)
    
    assert !@db.contacts.empty?
	end
end