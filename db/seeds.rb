require_relative ('../models/member')
require_relative ('../models/gym_class')

require ('pry')

member1 = Member.new({
  'name' => 'Shane Forster',
  'age' => '28',
  'membership_type' => 'premium',
  'status' => 'active',
  })

member2 = Member.new({
  'name' => 'Olivia Wright',
  'age' => '27',
  'membership_type' => 'basic',
  'status' => 'active',
  })

member3 = Member.new({
  'name' => 'Tiffany Forster',
  'age' => '34',
  'membership_type' => 'basic',
  'status' => 'inactive',
  })

member1.save()
member2.save()
member3.save()

Binding.pry
nil
