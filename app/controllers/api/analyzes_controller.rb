class Api::AnalyzesController < ApplicationController
  before_action :authenticate_api_user!

  def analyze
    @analysis = Calculations.new(params[:data]).perform
    render :json => { analysis: @analysis}, :status => 200
  end

  def correlate
    @correlations = Correlation.new(params[:dataset_1], params[:dataset_2]).correlate
    render :json => { correlation: @correlations}, :status => 200
  end

end
