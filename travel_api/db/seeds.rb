
# Check if there is an admin user
admin_user = User.find_by(email: "admin@admin.com")
if admin_user
  puts "Admin user already exists"
else
  admin_user = User.create!(email: "admin@admin.com", password: "password", password_confirmation: "password")
end


cities = [
  { name: "Santa Cruz", abbreviation: "sc" },
  { name: "Beni", abbreviation: "bn" },
  { name: "Pando", abbreviation: "pd" },
  { name: "Cochabamba", abbreviation: "cb" },
  { name: "La Paz", abbreviation: "lp" },
  { name: "Oruro", abbreviation: "or" },
  { name: "Potosi", abbreviation: "pt" },
  { name: "Sucre", abbreviation: "sc" },
  { name: "Tarija", abbreviation: "tj" }
]

cities.each do |city|
  City.create!(city)
end

# Manufacturers
manufacturers = [
  { name: "Mercedes Benz" },
  { name: "Toyota" },
  { name: "Hyundai" },
  { name: "Mazda" },
  { name: "Chevrolet" },
  { name: "Ford" },
  { name: "Renault" },
  { name: "Nissan" },
  { name: "Kia" },
  { name: "BMW" },
  { name: "Audi" },
  { name: "Volkswagen" },
  { name: "Peugeot" },
  { name: "Citroen" },
  { name: "Fiat" },
  { name: "Honda" },
  { name: "Suzuki" },
  { name: "Mitsubishi" },
  { name: "Dodge" },
  { name: "Jeep" },
  { name: "Chrysler" },
  { name: "Subaru" },
  { name: "Volvo" },
  { name: "Land Rover" },
  { name: "Jaguar" },
]
manufacturers_data = []
manufacturers.each do |manufacturer|
  manufacturer = Manufacturer.create!(manufacturer)
  manufacturers_data.append(manufacturer)
end

vehicle_models = [
  { name: "Model 1", manufacturer_id: rand(1..(manufacturers_data.size - 1)) },
  { name: "Model 2", manufacturer_id: rand(1..(manufacturers_data.size - 1)) },
  { name: "Model 3", manufacturer_id: rand(1..(manufacturers_data.size - 1)) },
  { name: "Model 4", manufacturer_id: rand(1..(manufacturers_data.size - 1)) },
  { name: "Model 5", manufacturer_id: rand(1..(manufacturers_data.size - 1)) },
  { name: "Model 6", manufacturer_id: rand(1..(manufacturers_data.size - 1)) },
  { name: "Model 7", manufacturer_id: rand(1..(manufacturers_data.size - 1)) },
]

vehicle_models_data = []
vehicle_models.each do |vehicle_model|
  vehicle_model = VehicleModel.create!(vehicle_model)
  vehicle_models_data.append(vehicle_model)
end

year_manufacturers = []
rand(30..50).times do
  year_manufacturer = YearManufacturer.create!(
    year: rand(1990..2020),
    vehicle_model_id: rand(1..(vehicle_models_data.size - 1))
  )
  year_manufacturers.append(year_manufacturer)
end

# bus_type
# total_seats
# available_seats
# status
# year_manufacturer_id

rand(30..50).times do
  Bus.create!(
    bus_type: rand(0..2),
    total_seats: rand(20..50),
    available_seats: rand(15..45),
    status: rand(0..2),
    year_manufacturer_id: rand(1..(year_manufacturers.size - 1)),
  )
end

rand(30..50).times do
  Person.create!(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    identity_document: Faker::IDNumber.valid,
    status: rand(0..1),
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
end