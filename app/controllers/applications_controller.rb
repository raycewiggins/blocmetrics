class ApplicationsController < ApplicationController
    def show
      @application = Application.find(params[:id])
      @events = @application.events
    end

    def new
      @user = current_user
      @application = Application.new
    end

    def create
      @user = current_user
      @application = @user.applications.build(application_params)

      if @application.save
        flash[:notice] = 'Your application has been registered successfully!'
        redirect_to user_application_path(@user, @application)
      else
        flash.now[:alert] = 'Error registering application. Please try again.'
        render :new
      end
    end

    def edit
      @user = current_user
      @application = Application.find(params[:id])
    end

    def update
      @application = Application.find(params[:id])
      @application.assign_attributes(application_params)

      if @application.save
        flash[:notice] = 'Application was updated successfully.'
        redirect_to user_application_path(@user, @application)
      else
        flash.now[:alert] = 'Error updating application. Please try again.'
        render :edit
      end
    end

    def destroy
      @application = Application.find(params[:id])

      if @application.destroy
        flash[:notice] = "\"#{@application.name}\" was deleted successfully."
        redirect_to user_path
      else
        flash.now[:alert] = 'There was an error deleting the application.'
        render :show
      end
    end

    private

    def application_params
      params.require(:application).permit(:url, :name)
    end

end
