class Product < ActiveRecord::Base


	default_scope { order('title') }	# This is different from the original version in the book
										# which is this :default_scope :order => 'title' , which
										# which will give an error. The reason for this is :
										# default_scope accept a block, lambda is necessary for scope(),
										# because there are 2 parameters, name and block.



	validates :title , :description , :image_url , presence: true
	validates :price , numericality: { greater_than_or_equal_to: 0.01 }
	validates :title , uniqueness: true

	validates :image_url, :format => {
    :with    => %r{\.(gif|jpg|png)\z}i,       # Here the original version of the book won't work which is %r{\.(gif|jpg|png)$}i,
    										  # the reason is ^ and $ are line anchors and \z is a string anchor which is what we want instead of line anchor.
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
