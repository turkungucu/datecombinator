class Profile < ActiveRecord::Base
  has_many :profile_urls
  has_many :profile_images
end
