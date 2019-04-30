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


  def update()
    sql = "UPDATE members
    SET(
      first_name,
      last_name,
      phone_number,
      email
      )
      =
      ($1,
       $2,
       $3,
       $4)
        WHERE
        id = $5;"
      values = [@first_name, @last_name, @phone_number, @email, @id]
      result = SqlRunner.run(sql, values)
      # p "We have updated the #{session_name} file"
  end

  def delete()
    sql = "DELETE
    FROM members
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)

     # p first_name + " " + last_name
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
    result = SqlRunner.run(sql, values).first
    # member = result.map{|each|Member.new(each)}
    members = Member.new(result)
    # p member.id
    # return members

  end

  def self.finding(id)
    sql = "SELECT *
          FROM members
          WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    member = result.map{|each|Member.new(each)}
# binding.pry
nil

  end



  def self.map_items(data)
    return data.map { |member| Member.new(member) }
  end

end
