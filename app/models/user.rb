class User < ApplicationRecord
  has_many :gossips
  has_many :comments
  belongs_to :city
  
  has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: "recipient_id", class_name: "PrivateMessage"

  has_secure_password

  has_many :likes
end
