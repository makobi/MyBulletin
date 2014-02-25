class MyBulletinsController < ApplicationController

  	def show
		@bulletin = MyBulletin.find(params[:id])
		@posts = Post.where(:posts => { :user_id => current_user.id})
	end

	def create
	  @bulletin = Bulletin.new(params[:my_bulletin])
	  if @bulletin.save
	    redirect_to root_url
	  else
	    render :action => 'user#new'
	  end
	end

	def edit
		@bulletin = Bulletin.find(params[:id])
	end

	def update
		@bulletin = Bulletin.find(params[:id])

		if @bulletin.update_attributes(params[:my_bulletin])
			redirect_to my_bulletins_path, :notice => "Your profile was updated"
		else
			render "edit"
		end
	end

	def destroy
		@bulletin = MyBulletin.find(params[:id])
		@bulletin.destroy
	end
end
