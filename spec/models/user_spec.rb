require 'rails_helper'

RSpec.describe User, type: :model do
  let(:sally) { User.new(first_name: 'Sally', last_name: 'Doe') }
  let(:john) { User.new(first_name: 'John', last_name: 'Smith') }
  let(:user) { sally }

  describe 'full_name' do
    it "returns the user's full name" do
      expect(user.full_name).to eq('Sally Doe') # Then
    end
  end

  describe 'last_first' do
    it "returns the user's full name with last name first" do
      expect(user.last_first).to eq('Doe, Sally') # Then
    end
  end

  describe 'report_attributes' do

    it 'returns hash' do
      expect(user.report_attributes).to be_a(Hash)
    end

    it 'returns a hash of all attributes to print in a report' do
      report_attrs = {
        "first_name" => user.first_name,
        "last_name" => user.last_name,
        "favorite_color" => user.favorite_color,
        "age" => user.age
      }
      expect(user.report_attributes).to eq(report_attrs)
    end

  end

end
