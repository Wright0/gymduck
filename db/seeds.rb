require_relative ('../models/member')
require_relative ('../models/lesson')
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

lesson1 = Lesson.new({
  'name' => 'Pilates',
  'class_type' => 'premium',
  'class_date' => 'Tuesday',
  'class_time' => '20:00'
  })

lesson1.save()


booking1 = Booking.new({
  'member_id' => member1.id,
  'lesson_id' => lesson1.id
  })

booking1.save


binding.pry
nil
