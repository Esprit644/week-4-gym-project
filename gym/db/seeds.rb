require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/session.rb')

Member.delete_all()

member1 = Member.new({'first_name' => 'John', 'last_name' => 'Brown', 'email' => 'j@hotmail', 'phone_number' => '01311111'})
member2 = Member.new({'first_name' => 'Peter','last_name' => 'Smith', 'email' => 'p@hotmail', 'phone_number' => '01312222' })
member3 = Member.new ({'first_name' => 'Gary', 'last_name' => 'Green', 'email' => 'g@hotmail', 'phone_number' => '01313333'})
member4 = Member.new({'first_name' => 'Mark', 'last_name' => 'Jones', 'email' => 'm@hotmail', 'phone_number' => '01314444'})


member1.save()
member2.save()
member3.save()
member4.save()

Member.find_all()
Member.find(member2.id)

member2.delete()
#
# session1 = Session.new({'session_name' => 'yoga', 'capacity' => '10', 'cost' => '5', 'time' => '1700'})
# session2 = Session.new({'session_name' => 'pilates', 'capacity' => '20', 'cost' => '6', 'time' =>'1800'})
# session3 = Session.new({'session_name' => 'circuits', 'capacity' => '30', 'cost' => '7', 'time' => '1900'})
#
# booking1 = Booking.new({'member_id' => member1.id, 'session_id' => session1.id})
# booking2 = Booking.new({'member_id' => member2.id, 'session_id' => session1.id})
#
# booking3 = Booking.new({'member_id' => member3.id, 'session_id' => session2.id)}
# booking4 = Booking.new({'member_id' => member4.id, 'session_id' => session3.id})
