# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

FieldServiceGroup.create(number: 101)
FieldServiceGroup.create(number: 202)
FieldServiceGroup.create(number: 303)

PRIVILEGE_OF_SERVICE = [
  "auxiliary pioneer",
  "regular pioneer",
  "special pioneer",
  "field missionary"
]

publishers = [
  { name: "Kenneth Cook, Jr." },
  { name: "Gage Fleegle" },
  { name: "Samuel Herd" },
  { name: "Geoffrey Jackson" },
  { name: "Stephen Lett" },
  { name: "Gerrit Lösch" },
  { name: "Mark Sanderson" },
  { name: "David Splane" },
  { name: "Jeffrey Winder" }
]

publishers.each do |publisher|
  Publisher.create(name: publisher[:name], privilege_of_service: [PRIVILEGE_OF_SERVICE.sample, nil].sample, field_service_group: FieldServiceGroup.all.sample)
end
