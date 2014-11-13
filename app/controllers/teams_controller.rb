class TeamsController < ApplicationController
	def index
		@team = Team.all
		@player = Player.all
		render "index"
	end

	def new
		@team = Team.new
	end

	def create
		Team.create(team_params)
		redirect_to "/"
	end


	def edit
		@team = Team.find(params[:id]) 
		# it will be looking for a view called edit, even though there is no render command 
		# otherwise, you could say : render "edit"

		# here, we find the team, then we update it, we don't need an instance variable here, a private variable "team" is sufficient 
		
		# team.update(params)
		# redirect_to "/"
	end

	def update
		# Need to first find the team to update!
		team = Team.find(params[:id])
		team.update(team_params)
			redirect_to "/"
	end

	def destroy
		team = Team.find(params[:id])
		team.destroy
		redirect_to "/"
		end

private

	def team_params
		params.require(:team).permit(:name, :country)
		
	end
end
