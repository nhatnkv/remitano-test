class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable

  has_many :movies,  foreign_key: :sharer_id

  def email_required?
    false
  end
end
