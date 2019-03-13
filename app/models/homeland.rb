class Homeland < ApplicationRecord

  # 与 user, homeland_posts 的关系
  belongs_to :user
  has_many :homeland_posts, :dependent => :destroy

  # 资料验证
  validates_presence_of :title, :description, :categories

  CATEGORIES = ["学习", "股票", "反馈", "公告"]
  validates_inclusion_of :categories, :in => CATEGORIES

  STATUS = ["公开", "不公开"]
  validates_inclusion_of :status, :in => STATUS

  # 与 homeland_like 的关系
  has_many :homeland_likes, :dependent => :destroy
  has_many :homeland_liked_users, :through => :homeland_likes, :source => :user

  def find_homeland_like(user)
    self.homeland_likes.where( :user_id => user.id ).first
  end

end
