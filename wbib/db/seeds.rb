# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r = Reference.create(url: "https://whatisnuclear.com/articles/waste.html", topic: "Nuclear Waste", annotation: "A description of what nuclear waste is")
r = Reference.create(url: "https://en.wikipedia.org/wiki/Donald_Trump", topic: "Donald Trump", annotation: "Yes, he's really a presidential candidate.")
