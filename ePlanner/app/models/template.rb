class Template < ActiveRecord::Base
	belongs_to :course

	validates :name, presence: true, uniqueness: true
end