require 'rails_helper'

RSpec.describe Notebook, type: :model do

  context "association tests" do
    it { should have_many(:notes) }
    it { should belong_to(:user) }
  end

end
