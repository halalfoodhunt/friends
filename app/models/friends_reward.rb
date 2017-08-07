class FriendsReward < ActiveRecord::Base
  belongs_to :reward
  
  has_attached_file :featured_image, styles: { large: "800x500#", medium: "450x300>", square: "500x500#", thumb: "100x67>" }, default_url: "/images/:style/image-placeholder.jpg"
  validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\Z/
end
