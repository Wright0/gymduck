require_relative('../db/sql_runner')

class Booking
  attr_reader :id, :member_id, :gym_class_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @lesson_id = options['lesson_id'].to_i
  end

  def save() #CREATE
    sql = "INSERT INTO bookings
    (
      member_id,
      lesson_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@member_id, @lesson_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def members_in_gym_class()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@lesson_id]
    results = SqlRunner.run(sql, values)
    Member.map_members(results)
  end


  # Helper method
  def self.map_bookings(booking_data)
    return booking_data.map{ |booking| Booking.new(booking)}
  end

end
