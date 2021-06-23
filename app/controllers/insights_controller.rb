class InsightsController < ApplicationController
  #http_basic_authenticate_with name: ENV.fetch("USER"), password: ENV.fetch("PASS"), except: %i(new create thanks)

  def index
    set_insights
    @new_insight = Insight.new
  end

  def new
    @insight = Insight.new
  end

  def thanks
  end

  def create
    set_insights
    @new_insight = Insight.new(insight_params)

    respond_to do |format|
      if @new_insight.save
        format.html { redirect_to insights_path, notice: "Insight salvo! Insight saved!" }
        format.json { render :show, status: :created, location: @new_insight }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @new_insight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @insight = Insight.find(params[:id])
    @insight.destroy
    respond_to do |format|
      format.html { redirect_to insights_url, notice: "Insight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_insights
    @insights = Insight.all.order(id: :desc)
  end

  def insight_params
    params.require(:insight).permit(:body)
  end
end
