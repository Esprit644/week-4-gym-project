require_relative('../db/sql_runner.rb')
require_relative('./member.rb')

class Booking

  attr_reader (:id)
  attr_accessor :member_id,:session_id

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

  def update()
    sql = "UPDATE bookings SET(
    session_id,
    member_id
    )
    = (
      $1,
      $2
      )
      WHERE id = $3;"
      values = [@session_id, @member_id, @id]
      SqlRunner.run(sql, values)
  end

  def delete_booking()
    sql = "DELETE FROM bookings WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def member()
    sql = "SELECT * FROM members where id = $1;"
    values = [@member_id]
    results = SqlRunner.run(sql,values).first
    member = Member.new(results)
    return member
  end

  def session()
    sql = "SELECT * FROM sessions WHERE id = $1;"
    values = [@session_id]
    results = SqlRunner.run(sql, values).first
    session = Session.new(results)
    return session
  end

  def self.show()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    list = results.map{|each|Booking.new(each)}
    return list
  end

  def self.find(id)
    sql = "SELECT * FROM bookings where id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    list = result.map{|each|Booking.new(each)}
    return list.first
  end

end
