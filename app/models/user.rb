class User < ApplicationRecord
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers
  has_many :postulations
  has_one_attached :image
         
  enum :role, [ :normal, :author, :admin ]
       
  validates :name,
    presence: { message: "No puede estar vacío" },
    length: { in: 1..100, message: "debe tener entre 1 y 100 caracteres" }
end

