puts 'Cleaning database...'
puts 'Creating products...'
# 5.times do
#   Product.create!(name: Faker::Coffee.blend_name, description: Faker::Coffee.notes, price: 1000, made_to_order?: false, stock: 10)
# end

puts 'Creating users...'
u = User.create!(email: "miguel.aguilera.croasdaile@gmail.com", password: "123456", password_confirmation: "123456", admin: true)
u = User.create!(email: "miguel@gmail.com", password: "123456", password_confirmation: "123456", admin: false)
puts 'Finished!'
