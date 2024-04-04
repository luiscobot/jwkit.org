# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

field_service_groups = [
  101,
  102,
  103
]

field_service_groups.each do |group|
  FieldServiceGroup.create(number: group)
end

service_privileges = [
  "auxiliary pioneer",
  "regular pioneer",
  "special pioneer",
  "field missionary"
]

service_privileges.each do |privilege|
  ServicePrivilege.create(name: privilege)
end

publishers = [
  "Kenneth Cook, Jr.",
  "Gage Fleegle",
  "Samuel Herd",
  "Geoffrey Jackson",
  "Stephen Lett",
  "Gerrit Lösch",
  "Mark Sanderson",
  "David Splane",
  "Jeffrey Winder"
]

FieldServiceGroup.all.each do |group|
  group_publishers = publishers.shift(3)

  group_publishers.each do |publisher|
    service_privilege = [ServicePrivilege.all.sample, nil].sample

    Publisher.create(name: publisher, service_privilege: service_privilege, field_service_group: group)
  end
end

User.create(email: "mail@jwkit.org")
