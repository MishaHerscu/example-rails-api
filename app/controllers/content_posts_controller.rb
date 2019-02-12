class ContentPostsController < ApplicationController
  before_action :set_content_post, only: [:show, :update, :destroy]

  # GET /content_posts
  # GET /content_posts.json
  def index
    @content_posts = ContentPost.all

    render json: @content_posts
  end

  # GET /content_posts/1
  # GET /content_posts/1.json
  def show
    render json: @content_post
  end

  # POST /content_posts
  # POST /content_posts.json
  def create
    @content_post = ContentPost.new(content_post_params)

    if @content_post.save
      render json: @content_post, status: :created, location: @content_post
    else
      render json: @content_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /content_posts/1
  # PATCH/PUT /content_posts/1.json
  def update
    if @content_post.update(content_post_params)
      head :no_content
    else
      render json: @content_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /content_posts/1
  # DELETE /content_posts/1.json
  def destroy
    @content_post.destroy

    head :no_content
  end

  private

    def set_content_post
      @content_post = ContentPost.find(params[:id])
    end

    def content_post_params
      params.require(:content_post).permit(:name, :company_id, :url, :content)
    end
end
