require 'rails_helper'

RSpec.describe Homework, type: :model do
  
  context "association tests" do
    it {should belong_to(:course)}
  end

  context "validation tests" do
    it { should validate_presence_of(:heading) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:due_date) }
  end

end
