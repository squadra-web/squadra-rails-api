class Api::V1::GroupsController < ApplicationController
  before_action :authorize_request
  before_action :find_group, except: %i[create index]

  # GET /groups
  def index
    @groups = Group.all
    render json: @groups, each_serializer: GroupSerializer, params: params[:include]
  end


  # GET /groups/{id}
  def show
    render json: @group, serializer: GroupSerializer, params: params[:include]
  end

  # GET /groups/{id}/teams
  def teams
    render json: @group.teams
  end
  

  # POST /groups
  def create
    @group = Group.new(group_params)
    @group.user_id = @current_user.id

    if @group.save
      render json: @group, serializer: GroupSerializer, params: params[:include], status: :created
    else
      render json: { errors: @group.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /groups/{id}
  def update
    unless @group.update(group_params)
      render json: { errors: @group.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /groups/{id}
  def destroy
    @group.destroy
  end

  private

  def find_group
    @group = Group.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Group not found' }, status: :not_found
  end

  def group_params
    params.permit(
      :name, :status, players_attributes: [:id, :name, :email, :phone, :birthdate, :position, :status, :team_id, :_destroy]
    )
  end
end
