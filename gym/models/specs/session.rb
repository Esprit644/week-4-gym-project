require('pry')
require_relative ('../db/sql_runner.rb')

class Session

  attr_reader (:id)
  attr_accessor(:session_name, :capacity, :cost, :session_time)

  def initialize(options)
    @id = options['id'].to_i
    @session_name = options['session_name']
    @capacity = options.['capacity'].to_i
    @cost = options.['cost'].to_i
    @session_time = options.['session_time'].to_i
  end

end
