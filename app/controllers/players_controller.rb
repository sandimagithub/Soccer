class PlayersController < ApplicationController
	# before filter will pull from the private definition assign_team and will use it only for the new and edit actions
	before_filter :assign_team, only: [:new, :edit]
	before_filter :assign_player, only: [:edit, :update, :destroy]
	
	def index
	end

# the form showing up is related this method
	def new
		# @team = Team.find(params[:team_id]) --see above for assign_team

		# by writing this ..we can connect it in the new form new.html.erb
		@player = Player.new
	end

	def create
		# first we have to find the team, then push in our new player
		# team = Team.find(params[:team_id]) 
		# player = Player.create(player_params)
		# team.players << player

		# so to refactor, we are just doing one create statement, instead of finding, and shoveling--this one is a refactor of three lines using "merge" b/c the players model is connected with with the team via the team_id. 
		player = Player.create(player_params.merge(team_id: params[:team_id]))

		redirect_to "/"
	end

	def edit

		# @team = Team.find(params[:team_id]) --see above assign_team
		# @	player = Player.find(params[:id]) --see above for assign_player
	end

	def show
	end

	def update
		# player = Player.find(params[:id])-see above for assign_player

		@player.update(player_params)
		redirect_to "/"
	end

# the route for delete: DELETE /teams/:team_id/players/:id(.:format)      players#destroy
	def destroy
		@player.destroy
		redirect_to "/"
	end

private

	def player_params
		params.require(:player).permit(:name, :jersey)
		
	end
# see above
	def assign_team
		@team = Team.find(params[:team_id]) 
	end

# see above
	def assign_player
		@player = Player.find(params[:id]) 

	end


end
