require ('pg')
class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'gym', host:'localhost' })
      db.prepare("query_var",sql)
      result = db.exec_prepared("query_var", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
