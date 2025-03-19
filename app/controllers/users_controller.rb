class UsersController < ApplicationController
  before_action :set_user, only: %i[ comments posts profile show ]
  allow_unauthenticated_access only: %i[ index show ]

  def comments
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :username ])
    end
end
