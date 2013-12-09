# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tournaments = Tournament.create([
  { tournament: 'Stanford Invitational', school: 'Stanford', date: '2013-10-12'},
  { tournament: 'Debaters Anonymous', school: 'Berkeley University', date: '2013-11-14'},
  { tournament: 'Yale Tournament', school: 'Yale University', date: '2012-02-25'}
  ])