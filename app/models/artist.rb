class Artist < ApplicationRecord
  belongs_to :billboard
  belongs_to :song
end
