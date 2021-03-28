class InsightsController < ApplicationController
  before_action :set_insight, only: %i[ show edit update destroy ]

  # GET /insights or /insights.json
  def index
    @insights = Insight.all
  end

  # GET /insights/1 or /insights/1.json
  def show
  end

  # GET /insights/new
  def new
    @insight = Insight.new
  end

  # GET /insights/1/edit
  def edit
  end

  # POST /insights or /insights.json
  def create
    @insight = Insight.new(insight_params)

    respond_to do |format|
      if @insight.save
        format.html { redirect_to @insight, notice: "Insight was successfully created." }
        format.json { render :show, status: :created, location: @insight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insights/1 or /insights/1.json
  def update
    respond_to do |format|
      if @insight.update(insight_params)
        format.html { redirect_to @insight, notice: "Insight was successfully updated." }
        format.json { render :show, status: :ok, location: @insight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insights/1 or /insights/1.json
  def destroy
    @insight.destroy
    respond_to do |format|
      format.html { redirect_to insights_url, notice: "Insight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insight
      @insight = Insight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insight_params
      params.require(:insight).permit(:q1, :q2)
    end
end
