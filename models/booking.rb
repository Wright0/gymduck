require_relative('../db/sql_runner')
require_relative('./membership_tiers')
require_relative('./member')
require_relative('./lesson')

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

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.find_by_other_ids(lessonid, memberid)
    sql = "SELECT * FROM bookings WHERE lesson_id = $1 and member_id = $2"
    value = [lessonid, memberid]
    booking_data = SqlRunner.run(sql, value).first
    return Booking.new(booking_data)
  end

  def members_in_lesson()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@lesson_id]
    results = SqlRunner.run(sql, values)
    Member.map_members(results)
  end

  def complete_booking?()
    member = Member.find_by_id(@member_id)
    lesson = Lesson.find_by_id(@lesson_id)

    if member.membership_status == "Inactive"
      return 'inactive member'
    elsif member.member_in_class?(lesson)
      return 'already in lesson'
    elsif member.membership_tier_invalid?(lesson)
      return 'wrong tier'
    else
      return 'can be booked'
    end
  end


  # Helper method
  def self.map_bookings(booking_data)
    return booking_data.map{ |booking| Booking.new(booking)}
  end

end
