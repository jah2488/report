
#user, pets, food


10.times do
  user = User.create(first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     age:rand(18...30),
                     favorite_color: %w(red blue yellow brown green orange).sample)
  3.times do
    user.meals.create(name: Faker::Hacker.noun,
                      cost: rand(5..99))
  end

  2.times do
    user.pets.create(name: %w(fido fluffy foobar ruby rm-rf git lilbuck beans iron mittens roofus).sample,
                     kind: %w(fish dog cat bird turtle vampire-bat rabbit).sample,
                     weight: rand(14..250)) #oz
  end
end
