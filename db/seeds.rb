# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |i|
  User.create([
                {
                  email: "user#{i}@example.com",
                  password: "user#{i}"
                }
              ])
end

5.times do |i|
  120.times do |j|
    Calory.create([
                    {
                      cont_calories: "#{rand(300)}",
                      date_calory: Date.today + j,
                      user_id: i,
                      type: Calory.types.keys.sample,
                      description_calory: Faker::Food.dish,
                      comment_calory: Faker::Food.description
                    }
                  ])
  end
end

p "Created #{User.count} enntries"
p "Created #{Calory.count} enntries"
