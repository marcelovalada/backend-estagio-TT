class VisitsController < ApplicationController
  # GET /visits
  def index
    @visits = Visit.order(created_at: :desc)
    render json: @visits
  end

  # GET /visits/1
  def show
    @visit = Visit.find(params[:id])
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
    @visit = Visit.find(params[:id])

    if @visit.update(visit_params)
      render json: @visit
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visits/1
  def destroy
    @visit = Visit.find(params[:id])

    @visit.destroy
  end

  private

  def visit_params
    params.require(:visit).permit(:data, :status, :user_id, :checkin_at, :checkout_at)
  end
end
