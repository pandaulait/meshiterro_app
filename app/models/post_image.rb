class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image # ここを追加（_idは含めません）
  has_many :post_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  varidates :shop_name,presence: true
  validates :image,presence: true

  def favorited_by?(user)
    favorites.where(user_id: user_id).exists?
  end
end
