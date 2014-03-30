class Deal < ActiveRecord::Base
has_many :line_items
has_many :orders, through: :line_items
before_destroy :ensure_not_referenced_by_any_line_item


CATEGORY = [ "Lunch", "Student Deal", "Coming Soon", "Fitness" ]
STATUS = [ "Valid", "Not Valid", "Deal Used", "Sold Out" ]
#todo need to add validation for deal table

#Geocoder
geocoded_by :address
after_validation :geocode

#Paperclip gem
validates :photo, presence: false

has_attached_file :photo, 
                  :url => "/app/assets/images/:filename",
				  :path => ":rails_root/app/assets/images/:filename",
				  :default_url => "/images/:style/missing.png"

				  
	  def self.latest
   Deal.order(:updated_at).last 
   end
		private
   def ensure_not_referenced_by_any_line_item 
    if line_items.empty?
   return true
   else errors.add(:base, 'Line Items present') 
    return false
  end 
end
end
