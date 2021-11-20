class Book < ApplicationRecord
  belongs_to :user
  # userモデルとの関連付け
  
  # attachment :image
  # 画像アップ用メソッド・・bookモデルに画像入れないからいらない？
end
