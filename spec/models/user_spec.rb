require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "association test" do
    it { should have_many(:notebooks) }
    it { should have_many(:tasks) }
    it { should have_many(:cohorts) }
    it { should have_many(:courses) }
    it { should have_many(:tasks) }
  end

  context "validation tests" do
    it { should validate_presence_of(:f_name) }
    it { should validate_presence_of(:l_name) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
    # it { should validate_uniqueness_of(:key) }
  end

end
