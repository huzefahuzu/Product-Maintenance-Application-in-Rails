class Product < ActiveRecord::Base

	validates :title , :description , :image_url , presence: true
	validates :price , numericality: { greater_than_or_equal_to: 0.01 }
	validates :title , uniqueness: true

	validates :image_url, :format => {
    :with    => %r{\.(gif|jpg|png)\z}i,       # Here the original version of the book won't work which is %r{\.(gif|jpg|png)$}i,
    										  # the reason is ^ and $ are line anchors and \z is a string anchor which is what we want instead of line anchor.
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
