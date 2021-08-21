puts 'Cleaning database...'
Teddy.destroy_all

puts 'Creating teddies...'
Teddy.create!(sku: 'original-teddy-bear', name: 'Teddy bear', photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Teddy-Bears-HD-Images.jpg', price: 1000)

Teddy.create!(sku: 'jean-mimi', name: 'Jean-Michel - Le Wagon', photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large', price: 1000)
Teddy.create!(sku: 'octocat',   name: 'Octocat -  GitHub',      photo_url: 'https://cdn-ak.f.st-hatena.com/images/fotolife/s/suzumidokoro/20160413/20160413220730.jpg', price: 1000)
puts 'Finished!'
