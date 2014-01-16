# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

      datafile = Rails.root + 'db/data/sample_activity.csv'
      CSV.foreach(datafile, headers: true) do |row|
        Activity.find_or_create_by(name: row['name']) do |activity|
          activity.name = row['name']
          activity.met = row['MET']
          activity.cardiovascular = row['cardiovascular']
          activity.bone_strength = row['bone_strength']
          activity.resistance = row['resistance']
        end
      end
