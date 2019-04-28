require('pry')
require_relative ('../db/sql_runner.rb')

class Session

  attr_reader (:id)
  attr_accessor(:session_name, :capacity, :cost, :session_time)

  def initialize(options)
    @id = options['id'].to_i
    @session_name = options['session_name']
    @capacity = options['capacity'].to_i
    @cost = options['cost'].to_i
    @session_time = options['session_time'].to_i
  end

  def save()
    sql = "INSERT INTO sessions (
    session_name,
    capacity,
    cost,
    session_time
    )
    VALUES (
      $1, $2, $3, $4
    )
      RETURNING id;"
      values = [@session_name, @capacity, @cost, @session_time]
      result = SqlRunner.run(sql, values)
      id = result.first['id']
      @id = id.to_i
  end

  def delete_session()
    sql = "DELETE FROM sessions WHERE id = $1 RETURNING *;"
    values = [@id]
    SqlRunner.run(sql, values)
    # p session_name
  end

  def update()
    sql = "UPDATE sessions
    SET(
      session_name,
      capacity,
      cost,
      session_time
      )
      =
      ($1,
       $2,
       $3,
       $4)
        WHERE
        id = $5;"
      values = [@session_name, @capacity, @cost, @session_time, @id]
      result = SqlRunner.run(sql, values)
      # p "We have updated the #{session_name} file"
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def self.show()
    sql = "SELECT * FROM sessions"
    result = SqlRunner.run(sql)
    list = result.map{|each|Session.new(each)}
    # p list
  end

  def self.find_session(id)
    sql = "SELECT * FROM sessions WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql,values).first
    # result.map{|each|Session.new(each)}
    sessions = Session.new(result)

    return sessions

  end

  def self.map_items(data)
    return data.map { |session| Session.new(session) }
  end

end
