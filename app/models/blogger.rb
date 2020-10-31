class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def likes
        self.posts.map do |post|
            post.likes
        end.sum
    end

    def featured_post
        max_likes = -1
        post_w_max = nil
        self.posts.each do |post|
            if post.likes > max_likes
                max_likes = post.likes
                post_w_max = post
            end
        end
        post_w_max
    end

end


