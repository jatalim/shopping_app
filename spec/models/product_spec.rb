require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { build(:product) }

    describe 'validations' do

    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:price) }
    it { expect(subject).to validate_presence_of(:quantity) }
    it { should have_many(:carted_products) }
    it { should have_many(:product_taggings) }


    end

end