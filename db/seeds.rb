puts 'Cleaning database...'

puts 'Creating products...'
Product.create!(name: 'Product bear', photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Product-Bears-HD-Images.jpg', price: 1000, made_to_order?: false, stock: 10)
Product.create!(name: 'Jean-Michel - Le Wagon', photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large', price: 1000, made_to_order?: false, stock: 10)
Product.create!(name: 'Octocat -  GitHub',      photo_url: 'https://cdn-ak.f.st-hatena.com/images/fotolife/s/suzumidokoro/20160413/20160413220730.jpg', price: 1000, made_to_order?: false, stock: 10)
puts 'Creating users...'
u = User.create!(email: "miguel.aguilera.croasdaile@gmail.com", password: "123456", password_confirmation: "123456")
puts 'Finished!'
