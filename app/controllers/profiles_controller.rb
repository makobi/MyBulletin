class ProfilesController < ApplicationController


	def show
		@profile = Profile.find(params[:id])
	end

	def create
	  @profile = Profile.new(params[:profile])
	  if @profile.save
	    redirect_to profile_path(@profile), :notice => 'User successfully added.'
	  else
	    render :action => 'user#new'
	  end
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])

		if @profile.update_attributes(params[:profile])
			redirect_to profiles_path, :notice => "Your profile was updated"
		else
			render "edit"
		end
	end
end
