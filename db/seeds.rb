User.create(email: 'receptionist@example.com', password: 'password', role: 'receptionist')
User.create(email: 'doctor@example.com', password: 'password', role: 'doctor')

10.times do |i|
  Patient.create(
    name: "Patient #{i+1}",
    age: rand(18..80),
    gender: ['Male', 'Female'].sample,
    created_at: rand(30.days).seconds.ago
  )
end