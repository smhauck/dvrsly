class CommentsController < ApplicationController
  before_action :resume_session
  before_action :set_comment, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  # GET /comments or /comments.json
  def index
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @pagy, @comments = pagy(User.find_by_id(params[:user_id]).comments)
    else
      @comments = Comment.all
    end
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = Current.user.id
    @comment.post_id = params[:post_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.user_id == Current.user.id
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to @comment.post, notice: "You can only edit your own comments."
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    if @comment.user_id == Current.user.id
    @comment.destroy!
      respond_to do |format|
        format.html { redirect_to request.referer, status: :see_other, notice: "Comment was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to @comment, notice: "You can only delete your own comments."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.expect(comment: [ :body, :content, :post_id, :user_id ])
    end
end
