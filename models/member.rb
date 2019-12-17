require_relative('../db/sql_runner')
require_relative('./membership_tiers')

class Member

  attr_accessor :first_name, :last_name, :age, :membership_tier_id, :membership_status
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age']
    @membership_tier_id = options['membership_tier_id'].to_i
    @membership_status = options['membership_status'] || "active"
  end

  def save() #Create
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      age,
      membership_tier_id,
      membership_status
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @membership_tier_id, @membership_status]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def self.all() #Read
    sql = "SELECT * FROM members ORDER BY last_name, first_name ASC "
    member_data = SqlRunner.run(sql)
    members = map_members(member_data)
    return members
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    member_data = SqlRunner.run(sql, values).first
    return Member.new(member_data)
  end

  def update() #Update
    sql = "UPDATE members
    SET
    (
      first_name,
      last_name,
      age,
      membership_tier_id,
    ) =
    (
      $1, $2, $3, $4
    ) WHERE id = $5"
    values = [@first_name, @last_name, @age, @membership_tier_id, @id]
    SqlRunner.run(sql, values)
  end

  def update_status() #Update only the status
    sql = "UPDATE members
    SET membership_status = $1 WHERE id = $2"
    values = [@membership_status, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all #Delete
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def lessons() #returns the classes a specific member is signed up for
    sql =" SELECT l.* FROM lessons l
    INNER JOIN bookings b ON b.lesson_id = l.id
    WHERE b.member_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Lesson.map_lessons(results)
  end

  def membership_tier_name() #returns the name of the membership tier from the id
    membership = MembershipTier.find_by_id(@membership_tier_id)
    return membership.name
  end

  def set_membership_status #toggles the membership status
    if membership_status == "active"
      @membership_status = "inactive"
    else
      @membership_status = "active"
    end
    update_status()
  end

  #Checks that a member's tier is high enough to take the lesson. Returns true or false
  def membership_tier_valid?(lesson)
    @membership_tier_id >= lesson.lesson_tier_id
  end

  def join_name()
    return "#{@first_name} #{@last_name}"
  end

# Helper methods
  def self.map_members(member_data)
    return member_data.map{ |member| Member.new(member)}
  end

end
