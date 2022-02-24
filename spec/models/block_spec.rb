require 'rails_helper'

RSpec.describe Block, type: :model do
  
  context "association tests" do
    it { should belong_to(:note) }
  end

end
