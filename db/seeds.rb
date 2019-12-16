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
  'name' => 'Shane Forster',
  'age' => '28',
  'membership_tier_id' => membership_tier1.id,
  'membership_status' => 'active'})

member2 = Member.new({
  'name' => 'Olivia Wright',
  'age' => '27',
  'membership_tier_id' => membership_tier2.id,
  'membership_status' => 'active'})

member3 = Member.new({
  'name' => 'Tiffany Forster',
  'age' => '34',
  'membership_tier_id' => membership_tier3.id,
  'membership_status' => 'inactive'})

member4 = Member.new({
  'name' => 'Cody Forster',
  'age' => '30',
  'membership_tier_id' => membership_tier1.id,
  'membership_status' => 'active'})

member5 = Member.new({
  'name' => 'Kate Forster',
  'age' => '29',
  'membership_tier_id' => membership_tier2.id,
  'membership_status' => 'active'})

member6 = Member.new({
  'name' => 'Josh Forster',
  'age' => '23',
  'membership_tier_id' => membership_tier3.id,
  'membership_status' => 'active'})

member1.save()
member2.save()
member3.save()
member4.save()
member5.save()
member6.save()
#
# lesson1 = Lesson.new({
#   'name' => 'Pilates',
#   'lesson_type' => 'premium',
#   'lesson_date' => 'Tuesday',
#   'lesson_time' => '20:00'
#   })
#
# lesson2 = Lesson.new({
#   'name' => 'Yoga',
#   'lesson_type' => 'basic',
#   'lesson_date' => 'Wednesday',
#   'lesson_time' => '18:00'
#   })
#
# lesson1.save()
# lesson2.save()
#
#
# booking1 = Booking.new({
#   'member_id' => member1.id,
#   'lesson_id' => lesson1.id
#   })
#
# booking2 = Booking.new({
#   'member_id' => member2.id,
#   'lesson_id' => lesson2.id
#   })
#
# booking3 = Booking.new({
#   'member_id' => member1.id,
#   'lesson_id' => lesson2.id
#   })
#
# booking1.save
# booking2.save
# booking3.save
#

binding.pry
nil
