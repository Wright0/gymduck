require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect(ENV["DATABASE_URL"])
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end

# To run on local machine, swap out the argument on Line 7 for:
# {dbname: '<Your_DB_Name>', host: 'localhost', user: 'postgres'}
# ENV["DATABASE_URL"] -> For Heroku