class Restaurant < ActiveRecord::Base
	include ActiveModel::Model
	require 'data_fetch/main.rb'

	#attr_accessor :name, :review_count, :latitude, :longitude, :city, :state, :zip, :avg_rating

	def self.get_restaurents_list

		restaurant_list = DataFetch::Main.get_restaurents
		result = []

		restaurant_list['businesses'].each do |rlist|
		result << rlist.select {|k,v| ["name", "review_count", "latitude", "longitude", "city", "state", "zip", "avg_rating"].include?(k) }
		end

		return result
	end
end