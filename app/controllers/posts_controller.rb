class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_status, :toggle_timeslot]
  access all: [:show, :index, :new, :create], user: {except: [:destroy, :update, :edit, :toggle_status, :toggle_timeslot]}, admin: :all

  # GET /posts
  def index
    if logged_in?(:admin)
    @posts = Post.all
  else 
    @posts = Post.approved
  end
    @page_title = "TLC Registration"
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def toggle_status
    if @post.pending?
      @post.approved!
    elsif @post.approved?
      @post.pending!
    end 
    redirect_to posts_url, notice: 'Post has been updated'
  end 
  
  def toggle_timeslot
    if @post.morning?
      @post.afternoon!
    elsif @post.afternoon?
      @post.morning!
    end 
    redirect_to posts_url, notice: 'Post has been updated'
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :name, :age, :body, :class_desired, :gender)
    end
end
