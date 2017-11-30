# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( name: "Example User",
              email: "example@railstutorial.org",
              password: "foobar",
              password_confirmation: "foobar",
              admin: true,
              superadmin: true,
              activated: true,
              activated_at: Time.zone.now,
              :organisation_attributes => {:name => "Google" })

99.times do |n|
  name = Faker::Name.name
  org = Faker::Company.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
User.create!(name:  name,
             email: email,
             password:              password,
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now,
             :organisation_attributes => {:name => org })
end

Organisation.create!(name: "Google")


TeamMember.create!( first_name: "Tim",
                    last_name: "Wilkinson",
                    email: "admin@tswdesign.co.uk",
                    organisation_id: "1",)

5.times do |n|
  created_at = Faker::Time.backward(5, :morning)
  updated_at = created_at + 8.hours
SigninSheet.create!(team_member_id: "1",
                    created_at: created_at,
                    updated_at: updated_at,
                    shift_length: (updated_at - created_at)/60/60,
                    signedin: false)
end
