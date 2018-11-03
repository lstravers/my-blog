class Article < ApplicationRecord
  validates :title, presence: true,
                    length: {minimum: 5},
            :description, presence: true,
end
