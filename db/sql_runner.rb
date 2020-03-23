# require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'd7upagge7vtkp9', 
      host: 'ec2-52-86-73-86.compute-1.amazonaws.com',
      user: 'wlbnrjkrelvgyl',
      password: '3afb7b90040979e059b627e678f7bee465f00b9cc6fa7d4dd601fec7a11bad8f'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
