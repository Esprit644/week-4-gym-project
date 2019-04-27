require('pry')
require_relative('../db/sql_runner.rb')

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

  def save()
    sql = "INSERT INTO members (
    first_name,
    last_name,
    email,
    phone_number
    )
    VALUES (
      $1, $2, $3, $4
    )

    RETURNING id"
    values = [@first_name, @last_name, @email, @phone_number]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id =id.to_i
  end

  def self.find_all()
    sql = "SELECT * FROM members;"
    result = SqlRunner.run(sql)
    list = result.map{|each|Member.new(each)}
    return list
    # binding.pry
     # p list
  end

  def self.delete_all()
    sql = "DELETE FROM members;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT *
          FROM members
          WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    individual = result.map{|each|Member.new(each)}
    #p individual
  end

  def delete()
    sql = "DELETE
    FROM members
    WHERE id = $1 RETURNING *;"
    values = [@id]
    # binding.pry
    SqlRunner.run(sql, values)

     #p first_name + " " + last_name
  end

end
