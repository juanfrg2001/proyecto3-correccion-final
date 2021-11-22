class Weight < ActiveRecord::Base
  belongs_to :user


  after_create do
    puts "You have touched an object"
  end
end
