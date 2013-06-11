class Contacts
	attr_accessor :id, :first_name, :last_name, :email, :notes

def initialize(params)
  @id = params[:id]
  @first_name = params[:first_name]
  @last_name = params[:last_name]
  @email = params[:email]
  @notes = params[:notes] || " "
end


end