class DetailsController < ApplicationController
  before_action :set_detail, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /details or /details.json
  def index
    @details = Detail.all
  end

  # GET /details/1 or /details/1.json
  def show
  end

  # GET /details/new
  def new
    #detail = Detail.new
    @detail = current_user.detail.build
  end

  # GET /details/1/edit
  def edit
  end

  # POST /details or /details.json
  def create
    #detail = Detail.new(detail_params)
    @detail = current_user.detail.build(detail_params)

    respond_to do |format|
      if @detail.save
        format.html { redirect_to detail_url(@detail), notice: "Detail was successfully created." }
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1 or /details/1.json
  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to detail_url(@detail), notice: "Detail was successfully updated." }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1 or /details/1.json
  def destroy
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to details_url, notice: "Detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    def correct_user
      @detail = current_user.detail.find_by(id: params[:id])
      redirect_to detail_path, notice: "Not Authorized to edit this user details" if @detail.nil?
    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detail_params
      params.require(:detail).permit(:First_name, :Last_name, :Caste, :Age, :Height_in_CMs, :Weight_in_KGs, :Phone_no, :Email, :user_id)
    end
end
