class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents
  has_many :postulations
  has_many :posts
  has_many_attached :files

  def full_rut
    return if rut.blank? && dv.blank?
    centena = rut%1000
    centena_de_mil = ((rut - centena)/1000)%1000
    if centena_de_mil == 0
      centena_de_mil_txt = ""
    else
      centena_de_mil_txt = centena_de_mil.to_s + "."
    end
    centena_de_millon = (rut - ((centena_de_mil*1000)+centena))/1000000
    if centena_de_millon == 0
      centena_de_millon_txt = ""
    else
      centena_de_millon_txt = centena_de_millon.to_s+"."
    end
    txt_rut = centena_de_millon_txt+centena_de_mil_txt+centena.to_s
    return if rut.blank? && dv.blank?
    "#{txt_rut}-#{dv&.upcase}"
  end
end
