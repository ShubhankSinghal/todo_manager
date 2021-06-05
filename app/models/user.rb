class User < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{name.to_s} #{email} #{password}"
  end
end
