class ProductImage < ApplicationRecord
  mount_uploader :content, CoverUploader

  belongs_to :product, optional: true
  # belongs_to :product
end
