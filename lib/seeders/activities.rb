module Seeders
  module Activities
    def self.seed(datafile)

      CSV.foreach(datafile, headers: true) do |row|
        Activity.find_or_create_by(name: row['name']) do |activity|
          activity.name = row['name']
          activity.met = row['MET']
          activity.cardiovascular = row['cardiovascular']
          activity.bone_strength = row['bone_strength']
          activity.resistance = row['resistance']
        end
      end
    end
  end
end
