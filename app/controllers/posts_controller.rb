class PostsController < ApplicationController

        def index
            # @posts = Post.all we will replace this old code - you can delete this line
        
            @posts = Post.order('created_at DESC').page(params[:page]).per(15)
        end
end                