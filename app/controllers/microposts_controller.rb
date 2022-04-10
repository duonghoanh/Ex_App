class MicropostsController < ApplicationController
    # before_action :logged_in_user, only: %i[create destroy]
    before_action :logged_in?, only: %i[create destroy]
    before_action :correct_user, only: :destroy

 
    def create
      @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(micropost_params[:image])
    if @micropost.save
      flash[:success] = 'Micropost created successfully'
      redirect_to root_path
      else
        render static_pages_home_path

      end
    end
  
    
      def destroy
        if @micropost.destroy
          flash[:success] = 'Micropost deleted'
        else
          flash[:danger] = 'Deleted fail'
        end
        redirect_to request.referrer || root_url
    end
  
    private
  
    def micropost_params
      params.require(:micropost).permit(:content, :image)

    end
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      flash[:danger] = 'the micropost doesn\'t exist'
      redirect_to root_url unless @micropost
    end

  end
  