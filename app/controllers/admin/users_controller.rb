class Admin::UsersController < Comfy::Admin::Cms::BaseController

  before_action :build_user,  :only => [:new, :create]
  before_action :load_user,   :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    render
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @user.save!
    flash[:success] = 'User created'
    redirect_to :action => :show, :id => @user
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create User'
    render :action => :new
  end

  def update
    the_user_params = user_params[:password].present? ? user_params : user_params.except(:password)
    @user.update_attributes!(the_user_params)
    flash[:success] = 'User updated'
    redirect_to [:admin, @user], notice: 'User was successfully updated.'
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update user'
    render :edit
  end

  def destroy
    @user.destroy
    flash[:success] = 'User deleted'
    redirect_to :action => :index
  end

protected

  def build_user
    @user = User.new(user_params)
  end

  def load_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'User not found'
    redirect_to :action => :index
  end

  def user_params
    params.fetch(:user, {}).permit(:first_name, :last_name, :email, :password, :approved, :suspended)
  end
end