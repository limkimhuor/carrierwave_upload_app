class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_one :cover, class_name: "ProductImage"
  accepts_nested_attributes_for :cover, allow_destroy: true

  # accepts_nested_attributes_for :cover,
    # reject_if: proc {|attributes| attributes["id"] && attributes["content"].blank? && attributes["content_cache"].blank?},
    # allow_destroy: true
  PRODUCT_PARAMS = [:name, :image, :image_cache]
  PRODUCT_COVER_PARAMS = [:id, :content, :content_cache]

  validates :name, :image, presence: true
end
