# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.destroy_all

car_1 = Car.create(model: 'citadine auto', description: 'manual car made to drive around the city')
car_2 = Car.create(model: 'citadine manual', description: 'amazing city car with manual speed box')


file_1 = URI.open('https://stat.overdrive.in/wp-content/odgallery/2020/06/57263_2020_Mercedes_Benz_GLS.jpg')
file_2 = URI.open('https://stat.overdrive.in/wp-content/odgallery/2022/01/61502_2022_Toyota_Camry-Hybrid.jpg')

car_1.photo.attach(io: file_1, filename: 'car_1.png', content_type: 'image/png')
car_2.photo.attach(io: file_2, filename: 'car_2.png', content_type: 'image/png')
