class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :check_login, only: [:edit, :update]

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/1/edit
    def edit
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User name was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

     private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      def check_login
        redirect_to :root if current_user == nil || @user.id != current_user.id
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:name)
      end
  end 