class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :price, presence: true, numericality: {greater_than: 0}
    validates :published_date, presence: true
    validates :publisher, presence: true
    validates :pages, presence: true, numericality: {greater_than: 0}
    validates :release_date, presence: true
end
