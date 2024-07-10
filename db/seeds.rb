### seed data 
# rails db:migrate:reset && rails db:seed 
# Users 

# reset data 
User.destroy_all 
KingsYangonUser.destroy_all
Contact.destroy_all
Item.destroy_all
BrandCategory.destroy_all
#-------------------------------------
admin = User.create(email: 'htet@gmail.com', name:'htet', department: 'IT', password:'password', title: 'software developer', position: 'senior', role: :admin)
puts "admin created"
management = User.create(email: 'yan@gmail.com', name:'yan', department: 'management', title: 'software developer', password: 'password', position: 'senior', role: :management)
puts 'management created'
kyg_user = KingsYangonUser.create(school_id: 'kyg123', password: 'password')
puts 'kyg user created'

# Contacts 
conact1 = Contact.create(student_name: 'kyw kyw', parent_name: 'U Ba', email: 'kywkyw@gmail.com', phone_number: '0989652451', birth_date: '2002-01-17', gender: 'male', nationality: 'myanmar', address: 'yangon', current_school: 'Bo 6', current_year_group: 'IGCSE', message: 'interested')
conact2 = Contact.create(student_name: 'su su ', parent_name: 'U Aung', email: 'susu@gmail.com', phone_number: '0989652423', birth_date: '2002-05-17', gender: 'female', nationality: 'myanmar', address: 'yangon', current_school: 'Bo 5', current_year_group: 'IGCSE', message: 'interested')

puts "#{Contact.count} contacts created"

# Items created 
Item.create(name: 'chicken', content:' best seller', price: 15455, discount_percentage: 10, brand_partner_id: 1 )
puts "#{Item.count} items created"

accessories = BrandCategory.create(name: 'Accessories', description: 'type of business accessories')
clothing = BrandCategory.create(name: 'Clothing & Accessory', description: 'type of business clothing and accessory')
health_and_beauty = BrandCategory.create(name: 'Health & Beauty', description: 'type of business health and beauty')
food_and_beverage =BrandCategory.create(name: 'F & B', description: 'type of business food and beverage ')
hospital = BrandCategory.create(name: 'Hospital', description: 'type of business hospital ')
hotel = BrandCategory.create(name: 'Hotels', description: 'type of business hotels  ')
sport =   BrandCategory.create(name: 'Sport & Recreation', description: 'type of business sport and recreation  ')

mdrive = BrandPartner.create(name: 'MDrive', brand_category: accessories)
unique = BrandPartner.create(name: 'Unique', brand_category: accessories)
ipanema_kids = BrandPartner.create(name: 'Ipanema Kids', brand_category: clothing)
power_house = BrandPartner.create(name: 'Power House', brand_category: clothing)
power_house = BrandPartner.create(name: 'Power House', brand_category: health_and_beauty)
inya_day_spa = BrandPartner.create(name: 'Inya Day Spa', brand_category: health_and_beauty)
eliza_skin_republic = BrandPartner.create(name: 'Eliza Skin Republic', brand_category: health_and_beauty)
glamour_beauty_spa = BrandPartner.create(name: 'Glamour Beauty & Spa', brand_category: health_and_beauty)
the_queen = BrandPartner.create(name: 'The Queen', brand_category: health_and_beauty)
noodle_bowl = BrandPartner.create(name: 'Noodle Bowl', brand_category: food_and_beverage)
my_hill = BrandPartner.create(name: 'My Hill', brand_category: food_and_beverage)
another_club = BrandPartner.create(name: 'Another Club', brand_category: food_and_beverage)
the_tea_club = BrandPartner.create(name: 'The Tea Club', brand_category: food_and_beverage)
yuki_mugi = BrandPartner.create(name: 'Yuki Mugi', brand_category: food_and_beverage)
black_canyon = BrandPartner.create(name: 'Black Canyon', brand_category: food_and_beverage)
teabrary = BrandPartner.create(name: 'Teabrary', brand_category: food_and_beverage)
tempo = BrandPartner.create(name: 'Tempo', brand_category: food_and_beverage)
rangoon_tea_house = BrandPartner.create(name: 'Rangoon Tea House', brand_category: food_and_beverage)
lizzo_mammo_cafe = BrandPartner.create(name: 'Lizzo & Mammo Cafe', brand_category: food_and_beverage)
galleria_9 = BrandPartner.create(name: 'The Galleria 9', brand_category: food_and_beverage)
horizons_restaurant = BrandPartner.create(name: 'Horizons Restaurants', brand_category: food_and_beverage)
oasis_bistro = BrandPartner.create(name: 'Oasis Bistro', brand_category: food_and_beverage)
atlas_rooftop = BrandPartner.create(name: 'Atlas Rooftop', brand_category: food_and_beverage)
the_bleacher = BrandPartner.create(name: 'The Bleacher', brand_category: food_and_beverage)
locale = BrandPartner.create(name: 'Locale', brand_category: food_and_beverage)
parami_pizza = BrandPartner.create(name: 'Parami Pizza', brand_category: food_and_beverage)
gekko = BrandPartner.create(name: 'Gekko', brand_category: food_and_beverage)
unioin_bar = BrandPartner.create(name: 'Union Bar & Grill Restaruant', brand_category: food_and_beverage)
ar_yu_hospital = BrandPartner.create(name: 'Ar Yu Hospital', brand_category: hospital)
novotel_yangon = BrandPartner.create(name: 'Novotel Yangon', brand_category: hotel)
melia = BrandPartner.create(name: 'Melia', brand_category: hotel)
awei_metta = BrandPartner.create(name: 'Awei Metta', brand_category: hotel)
awei_pila = BrandPartner.create(name: 'Awei Pila', brand_category: hotel)
hotel_ss = BrandPartner.create(name: 'Hotel SS', brand_category: hotel)
amata_resort = BrandPartner.create(name: 'Amata Resort & Spa Ngapali', brand_category: hotel)
hpa_an_residence = BrandPartner.create(name: 'My Hpa-An Residence', brand_category: hotel)
amata_garden_resort_inle = BrandPartner.create(name: 'Amata Garden Resort Inle', brand_category: hotel)
amata_garden_resort_bagan = BrandPartner.create(name: 'Amata Garden Resort Bagan', brand_category: hotel)
bagan_residence_by_amata = BrandPartner.create(name: 'My Bagan Residence by Amata', brand_category: hotel)
amata_resort_spa_andaman = BrandPartner.create(name: 'Amata Resort & Spa Andaman', brand_category: hotel)
malikha_lodage = BrandPartner.create(name: 'Malikha Lodage', brand_category: hotel)
aureum_bagan = BrandPartner.create(name: 'Aureum Bagan', brand_category: hotel)
aureum_inle = BrandPartner.create(name: 'Aureum Inle', brand_category: hotel)
aureum_naypyitaw = BrandPartner.create(name: 'Aureum Naypyitaw', brand_category: hotel)
shwse_san_eain = BrandPartner.create(name: 'Shwe San Eain', brand_category: hotel)
aureum_pyin_oo_lwin = BrandPartner.create(name: 'Aureum Pyin Oo Lwin', brand_category: hotel)
aureum_ngapli = BrandPartner.create(name: 'Aureum Ngapli', brand_category: hotel)
aureum_ngew_saung = BrandPartner.create(name: 'Aureum Ngew Saung', brand_category: hotel)
espace_by_aureum = BrandPartner.create(name: 'Espace by Aureum', brand_category: hotel)
popa_mountain_resort = BrandPartner.create(name: 'Popa Mountain Resort', brand_category: hotel)
merciel_retreat_ngapali = BrandPartner.create(name: 'Merciel Retreat & Resort Ngapali', brand_category: hotel)
myanmar_treasure_bagan = BrandPartner.create(name: 'Myanmar Treasure Bagan', brand_category: hotel)
pathein_hotel = BrandPartner.create(name: 'Pathein Hotel', brand_category: hotel)
oriental_ballooning = BrandPartner.create(name: 'Oreiental Ballooning', brand_category: sport)
balloon_over_bagan = BrandPartner.create(name: 'Balloon Over Bagan', brand_category: sport)
burma_boating = BrandPartner.create(name: 'Burma Boating', brand_category: sport)
yangon_water_boom = BrandPartner.create(name: 'Yangon Waterboom', brand_category: sport)
amata_cruise = BrandPartner.create(name: 'Amata Cruises', brand_category: sport)
yangon_equestrian_country = BrandPartner.create(name: 'Yangon Equestrian Country Club', brand_category: sport)

puts "#{BrandCategory.count} brand category created "
puts "#{BrandPartner.count} brand partners created"
