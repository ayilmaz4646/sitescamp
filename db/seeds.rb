# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Patron
  Nimbos::Patron.create(name: "Demo",title: "Demo Patron", appname: "modaltrans", email:"email@nimbo.com.tr",status: "active",locale: "TR",country_id:"TR", contact_name:"patron")
  Nimbos::User.create(name: "Demo", email:"email@nimbo.com.tr", password:"123456",password_confirmation:"123456", activation_state:"active", locale:"tr", language:"tr", rootuser: true, firstuser: true)