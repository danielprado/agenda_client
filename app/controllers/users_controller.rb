class UsersController < ActionController::Base

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
     begin
      response = @user.save
     rescue => e
        format.html { redirect_to root_path, notice: "Incorrect Email or Password" }
     else
        session[:user_id]=@user.id
        session[:token]=@user.token
        format.html { redirect_to contacts_url, notice: 'Welcome' }
     end
    end
  end

end
