### seed data 
# rails db:migrate:reset && rails db:seed 
# Users 
admin = User.create(email: 'htet@gmail.com', name:'htet', department: 'IT', password:'password', title: 'software developer', position: 'senior')
puts "admin created"
management = User.create(email: 'yan@gmail.com', name:'yan', department: 'management', title: 'software developer', password: 'password', position: 'senior')
puts 'management created'
kyg_user = KingsYangonUser.create(school_id: 'kyg123', password: 'password')
puts 'kyg user created'

# Contacts 
conact1 = Contact.create(student_name: 'kyw kyw', parent_name: 'U Ba', email: 'kywkyw@gmail.com', phone_number: '0989652451', birth_date: '2002-01-17', gender: 'male', nationality: 'myanmar', address: 'yangon', current_school: 'Bo 6', current_year_group: 'IGCSE', message: 'interested')
conact2 = Contact.create(student_name: 'su su ', parent_name: 'U Aung', email: 'susu@gmail.com', phone_number: '0989652423', birth_date: '2002-05-17', gender: 'female', nationality: 'myanmar', address: 'yangon', current_school: 'Bo 5', current_year_group: 'IGCSE', message: 'interested')

puts "#{Contact.count} contacts created"

# Items created 
Item.create(name: 'chicken', content:' best seller', price: 15455, discount_percentage: 10, brand_partner_id: 1 )
puts "#{Item.count} items created"