require_relative ('../models/membership_tiers')
require_relative ('../models/member')
require_relative ('../models/lesson')
require_relative ('../models/booking')

# require ('pry')

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
  'first_name' => 'Sandra',
  'last_name' => 'Oh',
  'age' => '34',
  'membership_tier_id' => membership_tier3.id,
  'membership_status' => 'Active'
  })

member2 = Member.new({
  'first_name' => 'Olivia',
  'last_name' => 'Wright',
  'age' => '27',
  'membership_tier_id' => membership_tier1.id,
  'membership_status' => 'Active'
  })

member3 = Member.new({
  'first_name' => 'Celine',
  'last_name' => 'Dion',
  'age' => '51',
  'membership_tier_id' => membership_tier3.id,
  'membership_status' => 'Active'
  })

member4 = Member.new({
  'first_name' => 'Rachel',
  'last_name' => 'McAdams',
  'age' => '41',
  'membership_tier_id' => membership_tier2.id,
  'membership_status' => 'Inactive'
  })

member5 = Member.new({
  'first_name' => 'Ryan',
  'last_name' => 'Reynolds',
  'age' => '43',
  'membership_tier_id' => membership_tier2.id,
  'membership_status' => 'Inactive'
  })

member6 = Member.new({
  'first_name' => 'Keanu',
  'last_name' => 'Reeves',
  'age' => '55',
  'membership_tier_id' => membership_tier2.id,
  'membership_status' => 'Active'
  })

member1.save()
member2.save()
member3.save()
member4.save()
member5.save()
member6.save()

lesson1 = Lesson.new({
  'name' => 'Spin',
  'lesson_tier_id' => membership_tier1.id,
  'date' => 'Tuesday',
  'time' => '20:00',
  'capacity' => 15
  })

lesson2 = Lesson.new({
  'name' => 'Yoga',
  'lesson_tier_id' => membership_tier2.id,
  'date' => 'Wednesday',
  'time' => '18:00',
  'capacity' => 3
  })

lesson3 = Lesson.new({
  'name' => 'Zumba',
  'lesson_tier_id' => membership_tier2.id,
  'date' => 'Wednesday',
  'time' => '11:00',
  'capacity' => 9
  })

lesson4 = Lesson.new({
  'name' => 'Boxing',
  'lesson_tier_id' => membership_tier3.id,
  'date' => 'Monday',
  'time' => '9:00',
  'capacity' => 20
  })

lesson1.save()
lesson2.save()
lesson3.save()
lesson4.save()

# Trial lesson - Trial member
booking1 = Booking.new({
  'member_id' => member2.id,
  'lesson_id' => lesson1.id
  })

# Basic lesson - Basic member
booking2 = Booking.new({
  'member_id' => member6.id,
  'lesson_id' => lesson2.id
  })

#Basic lesson - Premium member
booking3 = Booking.new({
  'member_id' => member3.id,
  'lesson_id' => lesson2.id
  })

#Premium lesson - Premium member
booking4 = Booking.new({
  'member_id' => member1.id,
  'lesson_id' => lesson4.id
  })

#Premium lesson - Premium member
booking5 = Booking.new({
  'member_id' => member3.id,
  'lesson_id' => lesson4.id
  })

#Basic lesson - Premium member
booking6 = Booking.new({
  'member_id' => member1.id,
  'lesson_id' => lesson3.id
  })

booking1.save
booking2.save
booking3.save
booking4.save

# binding.pry
# nil
