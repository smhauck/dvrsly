class PostsController < ApplicationController
  before_action :resume_session
  before_action :set_post, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index search show ]

  # GET /posts or /posts.json
  def index
    if params[:diversion_id]
      @pagy, @posts = pagy(Diversion.find_by_id(params[:diversion_id]).posts.order(created_at: :desc))
    elsif params[:blog_id]
      @pagy, @posts = pagy(Blog.find_by_id(params[:blog_id]).posts.order(created_at: :desc))
    elsif params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @pagy, @posts = pagy(User.find_by_id(params[:user_id]).posts.order(created_at: :desc))
    else
      @pagy, @posts = pagy(Post.all.order(created_at: :desc))
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    if params[:diversion_id]
      @in_diversion = true
    elsif params[:blog_id]
      @in_blog = true
    else
      @in_diversion = false
    end
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create

    if params[:blog_id]
      @blog = Blog.find_by_id(params[:blog_id])
      if @blog.user_id == Current.user.id
        @authorized = true
      end
    else
        @authorized = true
    end

    if @authorized
        @post = Post.new(post_params)
        @post.user_id = Current.user.id
        @post.diversion_id = params[:diversion_id]
        @post.blog_id = params[:blog_id]
    
        respond_to do |format|
          if @post.save
            format.html { redirect_to @post, notice: "Post was successfully created." }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
        else
          redirect_to blog_path(params[:blog_id]), alert: "You can only post to your own blog."
      end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.user_id == Current.user.id
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @post, notice: "You can only edit your own posts."
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.user_id == Current.user.id
      if @post.comments.present?
        @post.title = "Deleted by User"
        @post.body = "Deleted by User"
        @post.user_id = 1
        respond_to do |format|
          if @post.save
            format.html { redirect_to @post, notice: "Post was successfully deleted." }
            format.json { render :show, status: :ok, location: @post }
          else
            format.html { redirect_to @post, alert: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
      else
        @post.destroy!
        respond_to do |format|
          format.html { redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed." }
          format.json { head :no_content }
        end
      end
    else
      redirect_to @post, notice: "You can only delete your own posts."
    end
  end

def search
    if params[:q].present?
      @posts = Post.joins(:action_text_rich_text).where("title LIKE ? or action_text_rich_texts.body like ?", "%#{params[:q]}%", "%#{params[:q]}%")
      puts "POSTS FOUND: #{@posts.count}"
    else
      @posts = Post.none
      puts "NO POSTS FOUND"
    end
  end
  
    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :content, :title, :body, :blog_id, :diversion_id ])
    end
end
