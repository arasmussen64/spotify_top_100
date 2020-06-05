class Song < ApplicationRecord
    has_many :artists, dependent: :destroy
    has_many :billboards, through: :artists
end
