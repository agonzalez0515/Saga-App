5.times do
  School.create({
    name: Faker::University.name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip
    })
end

10.times do
  Teacher.create({ name: Faker::Beer.name,
                    email: Faker::Internet.email,
               password: 'password',
                        admin: false,
                        school: School.all.sample
    })
end

20.times do
  Team.create({  name: Faker::GameOfThrones.character,
           teacher: Teacher.all.sample,
            school: School.all.sample
    })
end

gender = %w[female male non-binary fluid]
animal = %w[unicorn wolf elephant tiger eagle capybara racoon dragon mouse butterfly]
shirts = %w[small, medium, large]

50.times do
    Student.create({
                         team: Team.all.sample,
                     school: School.all.sample,
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
