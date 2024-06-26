class Api::V1::TeamsController < ApplicationController
  before_action :authorize_request
  before_action :find_team, except: %i[create index]

  # GET /teams
  def index
    @teams = Team.where(filter_params)
    render json: @teams, each_serializer: TeamSerializer, params: params[:include]
  end


  # GET /teams/{id}
  def show
    render json: @team, serializer: TeamSerializer, params: params[:include]
  end
  

  # POST /teams
  def create
    @team = Team.new(team_params)
    @team.user_id = @current_user.id

    if @team.save
      render json: @team, serializer: TeamSerializer, params: params[:include], status: :created
    else
      render json: { errors: @team.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /teams/{id}
  def update
    unless @team.update(team_params)
      render json: { errors: @team.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /teams/{id}
  def destroy
    @team.destroy
  end

  # GET /teams/{id}/players
  def players
    render json: @team.players
  end

  private

  def find_team
    @team = Team.find_by_id!(params[:id])
    if @current_user.role != 'master' && @team.user_id != @current_user.id
      ActiveRecord::RecordNotFound
    end
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Team not found' }, status: :not_found
  end

  def team_params
    params.permit(:name, :group_id, :status, players_attributes: [:id, :name, :email, :phone, :birthdate, :status, :position, :group_id, :_destroy])
  end

  def filter_params
    params.permit!.except(:controller, :action, :include)
  end
end
