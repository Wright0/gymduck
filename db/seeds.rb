require_relative ('../models/member')
require_relative ('../models/gym_class')
require_relative ('../models/booking')

require ('pry')

member1 = Member.new({
  'name' => 'Shane Forster',
  'age' => '28',
  'membership_type' => 'premium',
  'status' => 'active'})

member2 = Member.new({
  'name' => 'Olivia Wright',
  'age' => '27',
  'membership_type' => 'basic',
  'status' => 'active'})

member3 = Member.new({
  'name' => 'Tiffany Forster',
  'age' => '34',
  'membership_type' => 'basic',
  'status' => 'inactive'})

member1.save()
member2.save()
member3.save()

gym_class1 = GymClass.new({
  'name' => 'Pilates',
  'class_type' => 'premium',
  'class_date' => 'Tuesday',
  'class_time' => '20:00'
  })

gym_class1.save()


booking1 = Booking.new({
  'member_id' => member1.id,
  'gym_class_id' => gym_class1.id
  })

booking1.save




binding.pry
nil
