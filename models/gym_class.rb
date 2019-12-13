require_relative('../db/sql_runner')

class Gym_class

  attr_accessor :name, :class_type, :class_date, :class_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @class_type = options['class_type']
    @class_date = options['class_date']
    @class_time = options['class_time']
  end

  def save() #Create
    sql = "INSERT INTO gym_classes
    (
      name,
      class_type,
      class_date,
      class_time
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @class_type, @class_date, @class_time]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

end
