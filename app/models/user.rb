class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  enum role: { admin: 1, member: 2 }

  Devise.setup do |config|
		config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
		require 'devise/orm/active_record'  

		config.scoped_views = true
	end

   has_many :ashops, dependent: :destroy
   has_many :amenucs, dependent: :destroy
   has_many :amenus, dependent: :destroy
   has_many :bshops, dependent: :destroy
   has_many :cshops, dependent: :destroy
   has_many :dshops, dependent: :destroy
   has_many :eshops, dependent: :destroy
   has_many :fshops, dependent: :destroy
   has_many :gshops, dependent: :destroy
   has_many :hshops, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :liked_posts, through: :likes, source: :ashop
   
   validates :accepted, presence: {message: 'に同意してください'}
   validates :username, presence: true, length: {minimum:8}, format: { with: /\A[A-Za-z][A-Za-z0-9_\-.]*\z/, allow_blank: true }
	
end
