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
  FieldServiceGroup.create!(number: group)
end

service_privileges = [
  "auxiliary_pioneer",
  "regular_pioneer",
  "special_pioneer",
  "field_missionary"
]

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

genders = ["male", "female"]

groups = ["other_sheep", "anointed"]

FieldServiceGroup.all.each do |group|
  # Take the first 3 publishers from the array and remove them, ensuring no duplication across groups
  group_publishers = publishers.shift(3)


  group_publishers.each_with_index do |publisher, index|
    first_name, last_name = publisher.split(' ', 2)  # Split the string into first and last names
    gender = genders.sample  # Randomly assign gender
    group_type = groups.sample  # Randomly assign group type
    service_privilege = [service_privileges.sample, nil].sample  # Randomly assign service privilege

    # Create the Publisher instance with all required attributes, using create! to raise errors
    Publisher.create!(
      first_name: first_name,
      last_name: last_name,
      gender: gender,
      group: group_type,
      service_privilege: service_privilege,
      field_service_group: group
    )
  end
end

# Create a User
User.create!(email: "dev@jwkit.org")  # Use create! here as well for consistency
