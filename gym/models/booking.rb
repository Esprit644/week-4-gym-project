require_relative('../db/sql_runner.rb')

class Booking

  attr_reader(:id, :member_id, :session_id)

  def initialize(options)
    @id = options['id'].to_i
    @member_id = options['member_id'].to_i
    @session_id = options['session_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings (
    member_id,
    session_id
    )
    VALUES (
      $1,
      $2)
      RETURNING id"
      values = [@member_id, @session_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def update_booking()
    sql = " UPDATE bookings SET(
    session_name,
    capacity,
    cost,
    session_time
    )
    = (
      $1,
      $2,
      $3,
      $4
      )
      WHERE id = $5;"
      values = [@session_name, @capacity, @cost, @session_time, @id ]
      SqlRunner.run(sql, values)

  end

  def delete_booking()
    sql = "DELETE FROM bookings WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  # def self.delete_all()
  #   sql = "DELETE FROM bookings"
  #   SqlRunner.run(sql)
  # end

  def self.show()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
     list = results.map{|each|Booking.new(each)}
    return list
    # p list
  end

  def self.show1()
    sql = "SELECT
    bookings.id,
    members.first_name,
    members.last_name,
    sessions.session_name,
    sessions.session_time
    FROM members
    INNER JOIN bookings
    ON members.id = bookings.member_id
    INNER JOIN sessions
    ON sessions.id = bookings.session_id;"
    results = SqlRunner.run(sql)
     list = results.map{|each|Booking.new(each)}
     list1 = results.map{|each|Member.new(each)}
     list2 = results.map{|each|Session.new(each)}
     # binding.pry
    return list, list1, list2
    # p list

  end

  def self.find(id)
    sql = "SELECT * FROM bookings where id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    list = result.map{|each|Booking.new(each)}
    # p list

  end

end
