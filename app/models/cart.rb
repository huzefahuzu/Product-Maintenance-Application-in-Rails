class Cart < ActiveRecord::Base

	has_many :line_items , dependent: :destroy



	# The below function checks if the product to be added in the cart for a particular 
	# user already exists , if it exists then it just increments the count of the product
	# instead of making a new entry .

	def add_product(product_id)
		
		current_item = line_items.where( product_id: product_id).first # here the field on the left side is the 
																 	   # name of the Column in the cart database.
																 	   # Here first returns first element of the collection
																 	   # of objects returned by the where condition.

		if current_item
			
			current_item.quantity += 1

		else
			puts line_items
			current_item = line_items.build( product_id: product_id)  # Here it stores the paticular cart_id and product_id 
																	  # by using the ex : a post has many comments and a comment belongd_to a single post.
																	  # So , we can insert a new comment with the particular post_id by using @post.comment.build(msg: "huzefa......")
																	  # which will insert the post_id and comment_id into the database simultaneously.

		end

		current_item


	end

	def total_price

		line_items.to_a.sum { |item| item.total_price }	# This has to understood from jay.
		
	end

end

