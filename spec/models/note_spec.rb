require 'rails_helper'

RSpec.describe Note, type: :model do
  
  context "association tests" do
    it { should belong_to(:notebook) }
    it { should have_many(:blocks) }
  end

  context "validation tests" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

end
