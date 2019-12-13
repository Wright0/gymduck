require_relative('../db/sql_runner')

class Member

  attr_accessor :name, :age, :membership_type, :status
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age']
    @membership_type = options['membership_type']
    @status = options['status']
  end

  def save() #Create
    sql = "INSERT INTO members
    (
      name,
      age,
      membership_type,
      status
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @age, @membership_type, @status]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def self.all() #Read
    sql = "SELECT * FROM members"
    member_data = SqlRunner.run(sql)
    members = map_members(member_data)
    return members
  end

  def update() #Update
    sql = "UPDATE members
    SET
    (
      name,
      age,
      membership_type,
      status
    ) =
    (
      $1, $2, $3, $4
    ) WHERE id = $5"
    values = [@name, @age, @membership_type, @status, @id]
    SqlRunner.run(sql, values)
  end



  def self.map_members(member_data)
    return member_data.map{ |member| Member.new(member)}
  end

end
