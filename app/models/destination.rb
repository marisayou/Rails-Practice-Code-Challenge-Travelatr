class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        dest_posts = Post.all.select {|post| post.destination == self}
        sorted_posts = dest_posts.sort_by {|post| post.created_at}.reverse
        if sorted_posts.length <= 5
            return sorted_posts
        else
            return sorted_posts.slice(0, 5)
        end
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

    def avg_bloggers_age
        bloggers = self.bloggers.uniq
        bloggers.map {|blogger| blogger.age}.sum.to_f/bloggers.length
    end
end
