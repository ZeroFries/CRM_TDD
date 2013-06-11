class String
    def to_number
      [*("a".."z")].index(self).to_i + 1
    end
end

class Contacts
	attr_accessor :id, :first_name, :last_name, :email, :notes

def initialize(params)
  @first_name = params[:first_name]
  @last_name = params[:last_name]
  @email = params[:email]
  @notes = params[:notes] || " "
  @id = id_constructor
end

private

  def id_constructor
  	name_array = []
  	name_array = @first_name.downcase.split('')
  	@last_name.split.each { |letter| name_array << letter.downcase }
  	name_array.inject(0) { |sum, letter| sum += letter.to_number }
  end

end