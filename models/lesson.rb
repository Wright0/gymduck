require_relative('../db/sql_runner')

class Lesson

  attr_accessor :name, :lesson_tier_id, :lesson_date, :lesson_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @lesson_tier_id = options['lesson_tier_id'].to_i
    @lesson_date = options['lesson_date']
    @lesson_time = options['lesson_time']
  end

  def save() #CREATE
    sql = "INSERT INTO lessons
    (
      name,
      lesson_tier_id,
      lesson_date,
      lesson_time
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @lesson_tier_id, @lesson_date, @lesson_time]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def self.all() #READ
    sql = "SELECT * FROM lessons"
    lesson_data = SqlRunner.run(sql)
    lessons = map_lessons(lesson_data)
    return lessons
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM lessons WHERE id = $1"
    values = [id]
    lesson_data = SqlRunner.run(sql, values).first
    return Lesson.new(lesson_data)
  end

  def update() #UPDATE
    sql = "UPDATE lessons
    SET
    (
      name,
      lesson_tier_id,
      lesson_date,
      lesson_time
    )  =
    (
      $1, $2, $3, $4
    )WHERE id = $5"
    values = [@name, @lesson_tier_id, @lesson_date, @lesson_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete() #DELETE
    sql = "DELETE FROM lessons WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def members() #returns the members taking a specific class
    sql ="SELECT m.* FROM members m
    INNER JOIN bookings b ON b.member_id = m.id
    WHERE b.lesson_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Member.map_members(results)
  end

  # Helper method
  def self.map_lessons(lesson_data)
    return lesson_data.map{ |lesson| Lesson.new(lesson)}
  end
end
