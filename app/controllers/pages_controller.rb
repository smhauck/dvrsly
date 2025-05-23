class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ about changelog faq index license privacy roadmap show terms ]
  before_action :resume_session
  before_action :set_page, only: %i[ edit update destroy ]


  def about
  end

  def changelog
  end

  def create
    @page = Page.new(page_params)
    # @page.user_id = Current.user.id

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: "page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy!

    respond_to do |format|
      format.html { redirect_to pages_path, status: :see_other, notice: "page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def faq
  end

  def guide
  end

  def index
    @pages = Page.all
  end

  def license
  end

  def new
    @page = Page.new
  end

  def roadmap
  end

  def show
    @page = Page.where("link = ?", params[:link])
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: "page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end


  def privacy
  end

  def terms
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      if params[:id]
        @page = Page.find(params.expect(:id))
      # elsif params[:link]
        # @page = Page.where("link = ?", params[:link])
      end
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.expect(page: [ :link, :title, :body ])
    end

end
