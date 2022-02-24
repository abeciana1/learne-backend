require 'rails_helper'

RSpec.describe Cohort, type: :model do
  
  context 'association tests' do
    it { should belong_to(:student) }
    it { should belong_to(:course) }
    it { should have_many(:lectures) }
  end

end
