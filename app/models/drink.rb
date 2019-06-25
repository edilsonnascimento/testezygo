class Drink < ApplicationRecord
  validates :name, :description, :image_url, presence: true
  validates :rating_avg, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :alcohol_level, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # Bitterness level
  validates :ibu, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  enum temperature: %i[
    hot
    warm
    ambient
    cold
    extra_cold
  ]
  paginates_per 50
  #def self.search_alcohol_level(query)
   # where("alcohol_level >= ?", query)
  #end

  scope :search_alcohol_level, ->(query) { where("alcohol_level >= ?", query) }
  scope :search_temperature, ->(query) { where("temperature >= ?", query) }
  scope :search_ibu, ->(query) { where("ibu >= ?", query) }
  scope :search_name, ->(query) { where("name like ?", "%#{query}%") }
 
end


