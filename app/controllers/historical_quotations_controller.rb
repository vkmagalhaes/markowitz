class HistoricalQuotationsController < ApplicationController
  before_action :set_historical_quotation, only: [:show, :edit, :update, :destroy]

  # GET /historical_quotations
  # GET /historical_quotations.json
  def index
    @historical_quotations = HistoricalQuotation.page params[:page]
  end

  # GET /historical_quotations/1
  # GET /historical_quotations/1.json
  def show
  end

  # GET /historical_quotations/new
  def new
    @historical_quotation = HistoricalQuotation.new
  end

  # GET /historical_quotations/1/edit
  def edit
  end

  # POST /historical_quotations
  # POST /historical_quotations.json
  def create
    @historical_quotation = HistoricalQuotation.new(historical_quotation_params)

    respond_to do |format|
      if @historical_quotation.save
        format.html { redirect_to @historical_quotation, notice: 'Historical quotation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @historical_quotation }
      else
        format.html { render action: 'new' }
        format.json { render json: @historical_quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historical_quotations/1
  # PATCH/PUT /historical_quotations/1.json
  def update
    respond_to do |format|
      if @historical_quotation.update(historical_quotation_params)
        format.html { redirect_to @historical_quotation, notice: 'Historical quotation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @historical_quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historical_quotations/1
  # DELETE /historical_quotations/1.json
  def destroy
    @historical_quotation.destroy
    respond_to do |format|
      format.html { redirect_to historical_quotations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historical_quotation
      @historical_quotation = HistoricalQuotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historical_quotation_params
      params.require(:historical_quotation).permit(:cry_date, :codbdi, :codneg, :tpmerc, :nomres, :especi, :prazot, :modref, :preabe, :premax, :premin, :premed, :preult, :preofc, :preofv, :totneg, :quatot, :voltot, :preexe, :indopc, :datven, :fatcot, :ptoexe, :codisi, :dismes)
    end
end
