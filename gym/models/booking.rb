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

end
