class UsersController < ApplicationController
  before_action :resume_session
  before_action :set_user, only: %i[ blogs comments edit posts profile show update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  def blogs
    @blogs = @user.blogs.all
  end

  def comments
  end

  def edit
  end

  def index
    @users = user.all
  end

  def posts
    @posts = @user.posts.all
  end

  def profile
  end

  def show
  end

  def update
    if @user.id == Current.user.id
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @user, notice: "You can only update your own account."
    end
  end

  def destroy
    if @user.id == Current.user.id
      @user.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: "User account was successfully deleted." }
        format.json { head :no_content }
      end
    else
      redirect_to @user, alert: "You can only delete your own account."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:username]
        @user = User.find_by(username: params[:username])
      else
        @user = User.find(params.expect(:id))
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :content, :username ])
    end
end
