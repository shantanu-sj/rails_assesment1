class RestaurantsController < ApplicationController

	def index
		restaurant_list = Restaurant.get_restaurents_list

		result = []

		restaurant_list.each do |list|
			result_hash = {}
			address = {}
		
			result_hash['restaurant_name'] = list['name']

			address["latitude"] = list['latitude'] 
			address["longitude"] = list['longitude'] 
			address["city"] = list['city'] 
			address["state"] = list['state']

			result_hash['address'] = address
		
			result_hash['rating'] = list['avg_rating']

			result << result_hash
		end
		render :json => result
	end
end