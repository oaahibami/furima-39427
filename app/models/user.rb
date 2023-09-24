class User < ApplicationRecord
  VALID_JAPANESE_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, format: { with: VALID_JAPANESE_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_JAPANESE_NAME_REGEX }
  validates :last_name_kana, presence: true, format: { with: KATAKANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: KATAKANA_REGEX }
  validates :date_of_birth, presence: true
  validates :nickname, presence:true
  validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid. Include both letters and numbers"

  has_many :items
end