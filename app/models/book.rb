class Book < ApplicationRecord
  belongs_to :user
  # userモデルとの関連付け
  validates :title, presence: true
  validates :body, presence: true

  validates :body, length: { in: 1..200 }

end
