require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "association test" do
    it { should have_many(:notebooks) }
    it { should have_many(:tasks) }
    it { should have_many(:cohorts) }
    it { should have_many(:courses) }
    it { should have_many(:tasks) }
  end

end
