require 'rails_helper'

RSpec.describe Homework, type: :model do
  
  context "association tests" do
    it {should belong_to(:course)}
  end

end
