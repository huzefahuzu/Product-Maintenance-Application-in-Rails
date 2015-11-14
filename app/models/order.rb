class Order < ActiveRecord::Base

	validates :name , :address , :email , :pay_type , presence: true

	PAYMENT_TYPES = [ "Cheque" , "Credit Card" , "Purchase Order"]

	validates :pay_type , inclusion: PAYMENT_TYPES

	has_many :line_items , dependent: :destroy



# The below method contains the cart object containing the order_id of the product.So, we need
# to update this order_id in the line_items table . Therefore , we are taking the values from the 
# order table and map the same columns in the line_items tables , if matched , we add the value
# corresponding to it in the line_items table , which in our case is order_id . 
# We also 
# make the cart_id nil here as the order is placed now because after the order is placed we destroy
# the cart_id and therefore the item disappears from the lin_items table which we don't want
# to. So making it nil just saves it from being removed .

	def add_line_items_from_cart(cart)

		cart.line_items.each do |item|
			
			item.cart_id = nil
			line_items << item

		end
		
	end


end
