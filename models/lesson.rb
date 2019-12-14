require_relative('../db/sql_runner')

class Lesson

  attr_accessor :name, :lesson_type, :lesson_date, :lesson_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @lesson_type = options['lesson_type']
    @lesson_date = options['lesson_date']
    @lesson_time = options['lesson_time']
  end

  def save() #CREATE
    sql = "INSERT INTO lessons
    (
      name,
      lesson_type,
      lesson_date,
      lesson_time
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @lesson_type, @lesson_date, @lesson_time]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def self.all() #READ
    sql = "SELECT * FROM lessons"
    lesson_data = SqlRunner.run(sql)
    lessons = map_lessons(class_data)
    return lessons
  end

  def update() #UPDATE
    sql = "UPDATE lessons
    SET
    (
      name,
      lesson_type,
      lesson_date,
      lesson_time
    )  =
    (
      $1, $2, $3, $4
    )WHERE id = $5"
    values = [@name, @lesson_type, @lesson_date, @lesson_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete() #DELETE
    sql = "DELETE FROM lessons WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def members() #returns the members taking a specific class


  end


  # Helper method
  def self.map_lessons(lesson_data)
    return lesson_data.map{ |lesson| Lesson.new(lesson)}
  end
end
