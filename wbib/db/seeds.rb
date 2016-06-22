# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r = Reference.create(url: "https://whatisnuclear.com/articles/waste.html", topic: "Nuclear Waste", annotation: "A description of what nuclear waste is")
r = Reference.create(url: "https://en.wikipedia.org/wiki/Donald_Trump", topic: "Donald Trump", annotation: "Yes, he's really a presidential candidate.")
r = Reference.create(url: "https://en.wikipedia.org/wiki/Hillary_Clinton", topic: "Hillary Clinton", annotation: "Yes, she's really a presidential candidate.")
r = Reference.create(url: "http://collider.com/", topic: "Collider Website", annotation: "One of those run of the mill film blogs")
r = Reference.create(url: "http://uncrate.com/", topic: "Uncrate", annotation: "One of those San-Fran-hipster websites I sadly frequent")
r = Reference.create(url: "http://hackaday.com/2016/06/21/walnut-windfall-winds-up-in-custom-keyboard/", topic: "Walnut Keyboard", annotation: "Someone really likes their keyboard")
r = Reference.create(url: "https://www.theatlas.com/charts/rk5h5FBB", topic: "Crying Jordan Article", annotation: "This is what journalism has come to...")
r = Reference.create(url: "http://sploid.gizmodo.com/going-to-space-in-movies-is-basically-a-suicide-mission-1782389442", topic: "Spaaaaace!", annotation: "SPAAAAAAAAAAAAAAAAACEEEEEEEEEEEEEE!")
r = Reference.create(url: "http://app.thefacesoffacebook.com/", topic: "Every Face on Facebook", annotation: "This is a bit creepy")
r = Reference.create(url: "http://www.everydayim.com/", topic: "Hustlin'", annotation: "But really though...I'm not")
