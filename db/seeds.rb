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
  'lesson_type' => 'premium',
  'lesson_date' => 'Tuesday',
  'lesson_time' => '20:00'
  })

lesson2 = Lesson.new({
  'name' => 'Yoga',
  'lesson_type' => 'basic',
  'lesson_date' => 'Wednesday',
  'lesson_time' => '18:00'
  })

lesson1.save()
lesson2.save()


booking1 = Booking.new({
  'member_id' => member1.id,
  'lesson_id' => lesson1.id
  })

booking2 = Booking.new({
  'member_id' => member2.id,
  'lesson_id' => lesson2.id
  })

booking3 = Booking.new({
  'member_id' => member1.id,
  'lesson_id' => lesson2.id
  })

booking1.save
booking2.save
booking3.save


binding.pry
nil
