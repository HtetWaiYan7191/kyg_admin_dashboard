admin = User.create(email: 'htet@gmail.com', name:'htet', department: 'IT', password:'password', title: 'software developer', position: 'senior', role: :admin)
puts "admin created"
management = User.create(email: 'chris@gmail.com', name:'chris', department: 'management', title: 'software developer', password: 'password', position: 'senior', role: :management)
puts 'management created'
