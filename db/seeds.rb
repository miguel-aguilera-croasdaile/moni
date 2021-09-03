puts 'Cleaning database...'

puts 'Creating products...'
Product.create!(sku: 'original-Product-bear', name: 'Product bear', photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Product-Bears-HD-Images.jpg', price: 1000)
Product.create!(sku: 'jean-mimi', name: 'Jean-Michel - Le Wagon', photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large', price: 1000)
Product.create!(sku: 'octocat',   name: 'Octocat -  GitHub',      photo_url: 'https://cdn-ak.f.st-hatena.com/images/fotolife/s/suzumidokoro/20160413/20160413220730.jpg', price: 1000)
puts 'Creating users...'
u = User.create!(email: "miguel.aguilera.croasdaile@gmail.com", password: "123456", password_confirmation: "123456")
puts 'Finished!'
