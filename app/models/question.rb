# frozen_string_literal: true

class Question < ApplicationRecord
  validates :text, presence: true,
                   length: { minimum: 5 }
  has_one_attached :image
  has_many_attached :images
  has_many :comments
  has_many :favourites
end
