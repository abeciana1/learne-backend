require 'rails_helper'

RSpec.describe Notebook, type: :model do

  context "association tests" do
    it { should have_many(:notes) }
    it { should belong_to(:user) }
  end

  context "validation tests" do
    it { should validate_presence_of(:heading) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user_id) }
    it { should validate_numericality_of(:user_id) }
  end

end
