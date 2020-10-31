class PostsController < ApplicationController
    before_action :all_bloggers, only: [:new, :create, :edit, :update]
    before_action :all_destinations, only: [:new, :create, :edit, :update]
    def new 
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            render "new"
        end
    end

    def show
        @post = Post.find(params[:id])
        
    end

    def edit
        @post = Post.find(params[:id])
        render "new"
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        render "show"
    end

    def like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        render "show"
    end

    private
    def post_params
        params.require(:post).permit(:blogger_id, :destination_id, :title, :content)
    end

    def all_bloggers
        @bloggers = Blogger.all
    end

    def all_destinations
        @destinations = Destination.all
    end
end