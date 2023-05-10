class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :update, :destroy]

  # GET /visits
  def index
    @visits = Visit.order(created_at: :desc)
    render json: @visits
  end

  # GET /visits/1
  def show
    render json: @visit
  end

  # POST /visits
  def create
    @visit = Visit.new(visit_params)

    if @visit.save
      render json: @visit, status: :created#, location: visit
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # PATCH /visits/1
  def update
    if @visit.update(visit_params)
      render json: @visit
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visits/1
  def destroy
    @visit.destroy
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:data, :status, :user_id, :checkin_at, :checkout_at)
  end
end
