class Order < ActiveRecord::Base

	has_many :order_products
	belongs_to :user

	validates :name, presence: true
	validates :email, presence: true
	validates :address_1, presence: true
	validates :post_code, presence: true
	validates :stripe_token, presence: true

	def total_price

		# local variable
		# @ sign means we can get it from other places
		t = 0

		self.order_products.each do |p|
			t += p.price_in_pence
			# can use this everywhere
			# send to Stripe next
			
		end

		return t

	end

end
