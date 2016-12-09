5.times do
  school_name = Faker::University.name
  School.create({
    name: school_name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip,
    admin_code: "#{school_name}+a",
    teacher_code: "#{school_name}+t"
    })
end

15.times do
  Teacher.create({ name: Faker::Beer.name,
                    email: Faker::Internet.email,
               password: 'password',
                        admin: false,
                        school: School.all.sample
    })
end

30.times do
  Team.create({  name: Faker::GameOfThrones.character,
           teacher: Teacher.all.sample,
            school: School.all.sample
    })
end

gender = %w[female male non-binary fluid]
animal = %w[unicorn wolf elephant tiger eagle capybara racoon dragon mouse butterfly]
shirts = %w[small, medium, large]

200.times do
  our_school = School.all.sample
    Student.create({
                    school: our_school,
                      team: our_school.teams.sample,
                      name: Faker::Name.name,
                     grade: rand(1..12),
                    gender: gender.sample,
                       GPA: (rand * (4) + 1).round(1),
                detentions: rand(0..5),
                fav_animal: animal.sample,
                shirt_size: shirts.sample,
                 allergies: 'none',
         emergency_contact: 'Mom'
        })
end
