require "test/unit"
require_relative "../Contact.rb"
require_relative "../Database.rb"

	def setup
		@contact = Contacts.new(:last_name => "G", :first_name => "Stu", :email => "sg@sg.com")
	end