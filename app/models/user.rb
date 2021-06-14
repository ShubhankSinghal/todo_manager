class User < ApplicationRecord
  has_secure_password
  has_many :todos

  def to_pleasant_string
    "#{id}. #{name.to_s} #{email} #{password}"
  end
end
