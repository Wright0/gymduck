require_relative('../db/sql_runner')

class Member

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age']
    @membership_type = options['membership_type']
    @status = options['status']
  end

  def save()
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

  def self.all()
    sql = "SELECT * FROM members"
    member_data = SqlRunner.run(sql)
    members = map_members(member_data)
    return members
  end


def self.map_members(member_data)
  return member_data.map{ |member| Member.new(member)}

end

end
