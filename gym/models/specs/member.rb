require('pry')
require_relative('./db/sql_runner.rb')

class Member

  attr_reader (:id)
  attr_accessor(:first_name, :last_name, :email, :phone_number)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
    @phone_number = options['phone_number'].to_i

  end


end
