class User < ActiveRecord::Base
    validates :username, presence: true

    has_one :profile
    has_many :todo_lists, :dependent => :delete_all
    has_many :todo_items, :through => :todo_lists, :source => :todo_items
    

end
