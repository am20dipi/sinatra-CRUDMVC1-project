3.times do 
    user = User.create(name: Faker::FunnyName.name, email: Faker::Internet.email)
    2.times do 
        user.nailpolishes.create(name: Faker::Lorem.sentence, brand: Faker::Lorem.sentence, color: Faker::Lorem.sentence)
    end
ends