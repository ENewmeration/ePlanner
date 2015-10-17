require 'rails_helper'

describe Course, type: :model do
	it 'is not valid with only name' do
		expect(FactoryGirl.build(:course, name: "Name")).not_to be_valid
	end
end