class PostsController < ApplicationController
  # before_action :set_post, only: %i[ show edit update destroy ]

  matestack_app TwitterClone::App
  include Components::Registry

  # GET /posts or /posts.json
  def index
    render TwitterClone::Pages::Posts::Index
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      ActionCable.server.broadcast('matestack_ui_core', {
        event: "cable__updated_post",
        data: post_component(post: @post)
      })
      render json: {
        message: 'Post was successfully updated.'
      }, status: :created
    else
      render json: {
        errors: @post.errors,
        message: 'Post could not be updated.'
      }, status: :unprocessable_entity
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new post_params

    @post.username = cookies[:username]

    if cookies[:username].blank?
      render json: {
        message: 'No username given!'
      }, status: :unprocessable_entity
    else

      if @post.save
        ActionCable.server.broadcast('matestack_ui_core', {
          event: :cable__created_post,
          data: post_component(post: @post)

        })
        render json: {
          message: 'Post was successfully created.'
        }, status: :created
      else
        render json: {
          errors: @post.errors,
          message: 'Post could not be created.'
        }, status: :unprocessable_entity
      end
    end
  end

  # PUT /posts/1/like
  def like
    @post = Post.find params[:id]
    @post.increment :likes_count

    if @post.save
      ActionCable.server.broadcast('matestack_ui_core', {
        event: "cable__liked_post",
        data: post_component(post: @post)
      })
      render json: {
        message: 'Post was successfully liked.'
      }, status: :created
    else
      render json: {
        errors: @post.errors,
        message: 'Post could not be liked.'
      }, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:username, :body)
  end
end
