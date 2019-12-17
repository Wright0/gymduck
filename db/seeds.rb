require_relative ('../models/membership_tiers')
require_relative ('../models/member')
require_relative ('../models/lesson')
require_relative ('../models/booking')

require ('pry')

membership_tier1 = MembershipTier.new({
  'name' => 'Trial'
  })

membership_tier2 = MembershipTier.new({
'name' => 'Basic'
})

membership_tier3 = MembershipTier.new({
  'name' => 'Premium'
  })

membership_tier1.save()
membership_tier2.save()
membership_tier3.save()

member1 = Member.new({
  'first_name' => 'Shane',
  'last_name' => 'Forster',
  'age' => '28',
  'membership_tier_id' => membership_tier1.id,
  'membership_status' => 'active'})

member2 = Member.new({
  'first_name' => 'Olivia',
  'last_name' => 'Wright',
  'age' => '27',
  'membership_tier_id' => membership_tier2.id,
  'membership_status' => 'active'})

member3 = Member.new({
  'first_name' => 'Tiffany',
  'last_name' => 'Forster',
  'age' => '34',
  'membership_tier_id' => membership_tier3.id,
  'membership_status' => 'inactive'})

member4 = Member.new({
  'first_name' => 'Cody',
  'last_name' => 'Forster',
  'age' => '30',
  'membership_tier_id' => membership_tier1.id,
  'membership_status' => 'active'})

member5 = Member.new({
  'first_name' => 'Kate',
  'last_name' => 'Forster',
  'age' => '29',
  'membership_tier_id' => membership_tier2.id,
  'membership_status' => 'active'})

member6 = Member.new({
  'first_name' => 'Josh',
  'last_name' => 'Forster',
  'age' => '23',
  'membership_tier_id' => membership_tier3.id,
  'membership_status' => 'active'})

member1.save()
member2.save()
member3.save()
member4.save()
member5.save()
member6.save()

lesson1 = Lesson.new({
  'name' => 'Pilates',
  'lesson_tier_id' => membership_tier1.id,
  'date' => 'Tuesday',
  'time' => '20:00',
  'capacity' => 5
  })

lesson2 = Lesson.new({
  'name' => 'Yoga',
  'lesson_tier_id' => membership_tier2.id,
  'date' => 'Wednesday',
  'time' => '18:00',
  'capacity' => 1
  })

lesson3 = Lesson.new({
  'name' => 'Zumba',
  'lesson_tier_id' => membership_tier3.id,
  'date' => 'Wednesday',
  'time' => '11:00',
  'capacity' => 9
  })

lesson4 = Lesson.new({
  'name' => 'Boxing',
  'lesson_tier_id' => membership_tier1.id,
  'date' => 'Monday',
  'time' => '9:00',
  'capacity' => 20
  })

lesson1.save()
lesson2.save()
lesson3.save()
lesson4.save()

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
