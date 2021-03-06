# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users_count = 100

f_name  = Faker::Name.first_name
l_name  = Faker::Name.last_name
email   = Faker::Internet.email
phone   = Faker::PhoneNumber.cell_phone
pword   = BCrypt::Password.create("x")
address = Faker::Address.street_address
zips    = Faker::Address.zip
r = rand(137)
# z = [33146, 33145, 33147, 33150, 33149, 2116, 33154, 33153, 33156, 33155, 33158,
#    33157, 33160, 33162, 33618, 33161, 33166, 33165, 33168, 33167, 33170, 33169,
#    33173, 33172, 33175, 33174, 33177, 33176, 33179, 33178, 33181, 33180, 33183,
#    33182, 33185, 33184, 33187, 33186, 33189, 33188, 33190, 33194, 33193, 33196,
#    33195, 33199, 33239, 33301, 33304, 91214, 33308, 33309, 33106, 33311, 33314,
#    33313, 33317, 33319, 33322, 33324, 33323, 33326, 33325, 33330, 33331, 33334,
#    70601, 34420, 33844, 33009, 33010, 33013, 33012, 33015, 33014, 85142, 33016,
#    34476, 33019, 33018, 33020, 33023, 33025, 33024, 33027, 33026, 33029, 33028,
#    33031, 33030, 33033, 33032, 33035, 33034, 33037, 33039, 33055, 33054, 33056,
#    33062, 33064, 33066, 33065, 33068, 18447, 33073, 77840, 33090, 33092, 33101,
#    33948, 33109, 33112, 33116, 33114, 33122, 33126, 33125, 33128, 33127, 34744,
#    33130, 33129, 33132, 33131, 33134, 33133, 33136, 33135, 33138, 33137, 33140,
#    33139, 33142, 33141, 33144, 33143]
(1..users_count).each do |a|
  a = User.create(
    first_name: f_name,
    last_name: l_name,
    email: email,
    address: address,
    phone: phone,
    password_digest: pword,
    zip: zips
    )
  end
