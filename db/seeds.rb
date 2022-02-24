# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

url = "https://raw.githubusercontent.com/FormidableLabs/radon-typeahead/master/demo/car-models.json"
cars_serialized = URI.open(url).read
cars = JSON.parse(cars_serialized)

Car.destroy_all

addresses = [
  '11 rue du lycée, 06000 Nice, France',
  '12 rue de la fontaine au roi, 75011 Paris, France',
  'Strand, London WC2R 2LS, Royaume-Uni',
  '121 Worcester Rd, Framingham MA 1701',
  '555 East Main St, Orange MA 1364',
  '17 rue de la préfecture, 06300 Nice, France',
  "35 rue de l'abbé Grégoire, 75006 Paris, France",
  '29 Great Suffolk St, London SE1 0NS, Royaume-Uni',
  '21 rue Haxo, 13001 Marseille, France',
  'Opernring 2, 1010 Wien, Autriche',
  '20 Piazza della Repubblica, 20124 Milano MI, Italie'
]

puts 'Cars destroyed'
puts 'creating  cars...'

10.times do
  random = rand(0..cars.length - 1)
  last_model = cars[random]['models'].length - 1
  Car.create(
    brand: "#{cars[random]['brand']}",
    model: "#{cars[random]['models'][rand(0..last_model)]}",
    description: 'Great car, easy to drive',
    address: "#{addresses.sample}"
  )
  file = URI.open('https://stat.overdrive.in/wp-content/odgallery/2020/06/57263_2020_Mercedes_Benz_GLS.jpg')
  Car.last.photo.attach(io: file, filename: 'car.png', content_type: 'image/png')
end

puts '10 cars created'
