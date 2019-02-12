#
class UsersController < ProtectedController
  skip_before_action :authenticate, only: [:signup, :signin]

  # POST '/sign-up'
  def signup
    user_credentials = user_creds
    user_credentials[:hbt_admin] = false
    user_credentials[:company_admin] = false
    user_credentials[:trusted_dev] = false
    user_credentials[:company_id] = 1
    user = User.create(user_credentials)
    if user.valid?
      render json: user, status: :created
    else
      head :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:email],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out/1'
  def signout
    if current_user == User.find(params[:id])
      current_user.logout
      head :no_content
    else
      head :unauthorized
    end
  end

  # PATCH '/change-password/:id'
  def changepw
    if !current_user.authenticate(pw_creds[:old]) ||
       (current_user.password = pw_creds[:new]).blank? ||
       !current_user.save
      head :bad_request
    else
      head :no_content
    end
  end

  def index
    render json: User.all
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user_credentials = user_creds
    return false if @current_user.email != user_credentials[:email]

    if @current_user.update(user_creds)
      head :no_content
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(@current_user).destroy
    head :no_content
  end

  def update_recommendations
    p 'TODO: write update_recommendations method'
    # user_credentials = user_creds
    # return false if @current_user.email != user_credentials[:email]
    #
    # begin
    #   refresh_user_events(@current_user)
    #   head :no_content
    # rescue
    #   render json: ''
    # end
  end

  private

  def user_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation, :givenname,
                  :surname, :linkedin_url, :personal_site_url, :twitter_url,
                  :github_url, :blurb, :profile_img_url,
                  :content_recommendations, :hire_recommendations, :trust_links,
                  :company_id)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end

  private :user_creds, :pw_creds
end
