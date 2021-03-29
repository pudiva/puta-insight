class InsightsController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("USER"), password: ENV.fetch("PASS"), except: %i(new create)

  def index
    @insights = Insight.all
  end

  def new
    @insight = Insight.new
  end

  def thanks
  end

  def create
    @insight = Insight.new(insight_params)

    respond_to do |format|
      if @insight.save
        format.html { redirect_to thanks_insights_path }
        format.json { render :show, status: :created, location: @insight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insight.errors, status: :unprocessable_entity }
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

  def insight_params
    params.require(:insight).permit(:q1, :q2)
  end
end
