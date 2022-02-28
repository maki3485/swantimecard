class Outpost < ApplicationRecord
    validates :content, {presence: true}
end
