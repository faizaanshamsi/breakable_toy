require 'spec_helper'
require 'csv'

describe Seeders::Activities do
  let(:seeder) { Seeders::Activities }
  datafile = Rails.root + 'db/data/sample_activity.csv'

  it 'seeds activities' do
    count = count_lines(datafile)
    seeder.seed(datafile)
    expect(Activity.all.count).to eql(count)
  end

  it 'does not create duplicates' do
    seeder.seed(datafile)
    count_after_seed = Activity.count
    seeder.seed(datafile)
    expect(Activity.count).to eql(count_after_seed)
  end
end

def count_lines(datafile)
  i = 0
  CSV.foreach(datafile, headers: true) do |row|
    i += 1
  end
  i
end
