class BanReasonsController < ApplicationController
  before_action :set_ban_reason, only: %i[ show edit update destroy ]

  # GET /ban_reasons or /ban_reasons.json
  def index
    @ban_reasons = BanReason.all
  end

  # GET /ban_reasons/1 or /ban_reasons/1.json
  def show
  end

  # GET /ban_reasons/new
  def new
    @ban_reason = BanReason.new
  end

  # GET /ban_reasons/1/edit
  def edit
  end

  # POST /ban_reasons or /ban_reasons.json
  def create
    @ban_reason = BanReason.new(ban_reason_params)

    respond_to do |format|
      if @ban_reason.save
        format.html { redirect_to @ban_reason, notice: "Ban reason was successfully created." }
        format.json { render :show, status: :created, location: @ban_reason }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ban_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ban_reasons/1 or /ban_reasons/1.json
  def update
    respond_to do |format|
      if @ban_reason.update(ban_reason_params)
        format.html { redirect_to @ban_reason, notice: "Ban reason was successfully updated." }
        format.json { render :show, status: :ok, location: @ban_reason }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ban_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ban_reasons/1 or /ban_reasons/1.json
  def destroy
    @ban_reason.destroy!

    respond_to do |format|
      format.html { redirect_to ban_reasons_path, status: :see_other, notice: "Ban reason was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ban_reason
      @ban_reason = BanReason.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ban_reason_params
      params.expect(ban_reason: [ :name, :description ])
    end
end
