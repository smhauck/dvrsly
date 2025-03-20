class DiversionsController < ApplicationController
  before_action :resume_session
  before_action :set_diversion, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  # GET /diversions or /diversions.json
  def index
    @pagy, @diversions = pagy(Diversion.all)
  end

  # GET /diversions/1 or /diversions/1.json
  def show
    @pagy, @posts = pagy(@diversion.posts.all)
  end

  # GET /diversions/new
  def new
    @diversion = Diversion.new
  end

  # GET /diversions/1/edit
  def edit
  end

  # POST /diversions or /diversions.json
  def create
    @diversion = Diversion.new(diversion_params)
    @diversion.user_id = Current.user.id

    respond_to do |format|
      if @diversion.save
        format.html { redirect_to @diversion, notice: "Diversion was successfully created." }
        format.json { render :show, status: :created, location: @diversion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diversions/1 or /diversions/1.json
  def update
    respond_to do |format|
      if @diversion.update(diversion_params)
        format.html { redirect_to @diversion, notice: "Diversion was successfully updated." }
        format.json { render :show, status: :ok, location: @diversion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diversions/1 or /diversions/1.json
  def destroy
    @diversion.destroy!

    respond_to do |format|
      format.html { redirect_to diversions_path, status: :see_other, notice: "Diversion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diversion
      @diversion = Diversion.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def diversion_params
      params.expect(diversion: [ :title, :description, :user_id ])
    end
end
