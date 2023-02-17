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

city_data = []
cities.each do |city|
  city = City.create!(city)
  city_data.append(city)
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

rand(30..50).times do
  Bus.create!(
    bus_type: rand(1..2),
    total_seats: rand(20..50),
    available_seats: rand(15..45),
    status: rand(1..2),
    year_manufacturer_id: rand(1..(year_manufacturers.size - 1)),
  )
end

person_data = []
rand(30..50).times do
  person = Person.create!(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    identity_document: Faker::IDNumber.valid,
    status: rand(1..1),
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
  person_data.append(person)
end

route_data = []
rand(30..50).times do
  city_origin = city_data[rand(1..(city_data.size - 1))]
  city_destination = city_data[rand(1..(city_data.size - 1))]
  route = Route.create!(
    name: "#{city_origin.name} - #{city_destination.name}",
    price: rand(100..400),
    distance: "#{rand(100..400)} km",
  )
  route_data.append(route)
end

rand(30..50).times do
  RouteCity.create!(
    route_id: route_data[rand(1..(route_data.size - 1))].id,
    city_id: city_data[rand(1..(city_data.size - 1))].id,
    origin: Faker::Boolean.boolean,
    destination: Faker::Boolean.boolean
  )
end

customer_data = []
rand(10..20).times do
  customer = Customer.create!(
    person_id: person_data.sample.id,
  )
  customer_data.append(customer)
end

user_data = []
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
  )
  user_data.append(user)
end

staff_data = []
staff_person_data = person_data - customer_data
rand(10..20).times do
  staff = Staff.create!(
    person_id: staff_person_data.sample.id,
  )
  staff_data.append(staff)
end

driver_data = []
rand(10..20).times do
  driver = Driver.create!(
    staff_id: staff_data.sample.id,
    driver_licence: Faker::IDNumber.valid,
    user_id: user_data.sample.id,
  )
  driver_data.append(driver)
end

driver_assistant_data = []
rand(10..20).times do
  driver_assistant = DriverAssistant.create!(
    staff_id: staff_data.sample.id,
    user_id: user_data.sample.id,
  )
  driver_assistant_data.append(driver_assistant)
end

sale_person_data = []
rand(10..20).times do
  sale_person = SalePerson.create!(
    staff_id: staff_data.sample.id,
    user_id: user_data.sample.id,
  )
  sale_person_data.append(sale_person)
end

travel_data = []
rand(30..50).times do
  travel = Travel.create!(
    departure_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    arrival_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
    departure_city: city_data.sample.name,
    arrival_city: city_data.sample.name,
    status: rand(1..1),
    bus_id: Bus.all.sample.id,
    route_id: route_data.sample.id,
    driver_id: driver_data.sample.id,
    driver_assistant_id: driver_assistant_data.sample.id,
  )
  travel_data.append(travel)
end

rand(30..50).times do
  Sale.create!(
    total_amount: rand(1..10),
    unitary_amount: rand(100..400),
    sale_person_id: SalePerson.all.sample.id,
    customer_id: Customer.all.sample.id,
    travel_id: travel_data.sample.id,
  )
end