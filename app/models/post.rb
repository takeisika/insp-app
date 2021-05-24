class Post < ApplicationRecord
    validates :title,{presence:true,length:{maximum:50}}
    has_many_attached :files
    has_many_attached :movies
end
