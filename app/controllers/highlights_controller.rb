class HighlightsController < ApplicationController
  before_action :set_highlight, only: [:show, :edit, :update, :destroy]
  before_filter :check_admin, only: [:edit, :update, :destroy]
  before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  # GET /highlights
  # GET /highlights.json
  def index
    @highlights = Highlight.order("id DESC").page(params[:page]).per(10)
    # @highlights_list = Highlight.where(user_id: current_user).where('created_at BETWEEN ? AND ? ', 1.month.ago.beginning_of_month , 1.month.ago.end_of_month).order("id DESC")
    @highlights_by_month = Highlight.where(user_id: current_user).select("id, user_id, page_title, page_url, created_at").order("id DESC").find(:all).uniq_by{|highlight| highlight.page_title}.group_by { |highlight| highlight.created_at.strftime("%b %G") }
  end

  # GET /highlights/1
  # GET /highlights/1.json
  def show
  end

  # GET /highlights/new
  def new
    @highlight = Highlight.new
  end

  # GET /highlights/1/edit
  def edit
  end

  # POST /highlights
  # POST /highlights.json
  def create
    @highlight = Highlight.new(highlight_params)

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to @highlight, notice: 'Highlight was successfully created.' }
        format.json { render action: 'show', status: :created, location: @highlight }
      else
        format.html { render action: 'new' }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /highlights/1
  # PATCH/PUT /highlights/1.json
  def update
    respond_to do |format|
      if @highlight.update(highlight_params)
        format.html { redirect_to @highlight, notice: 'Highlight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # def options
  #   if access_allowed?
  #     set_access_control_headers
  #     head :ok
  #   else
  #     head :forbidden
  #   end
  # end

  # DELETE /highlights/1
  # DELETE /highlights/1.json
  def destroy
    @highlight.destroy
    respond_to do |format|
      format.html { redirect_to highlights_url }
      format.json { head :no_content }
    end
  end

  # GET /highlights/from/{query}
  def from
    unless params[:title].nil?
      @highlights = Highlight.order("id DESC").where("page_title LIKE ?", "%"+params[:title]+"%")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highlight
      @highlight = Highlight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def highlight_params
      params.require(:highlight).permit(:selected_text, :surrounding_text, :page_url, :page_title, :user_id)
    end

    def check_admin
      if !current_user.try(:admin?)
        redirect_to '/'
      end
    end

    def verify_authenticity_token
      # Test if user’s ID matches their token
      @user = User.find_by_id(params[:user].to_i)
      @user.authentication_token == params[:token].to_s
      # TODO: Should probably return a proper error if check fails.
    end

    # def set_access_control_headers 
    #   headers['Access-Control-Allow-Origin'] = request.env['HTTP_ORIGIN']
    #   headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #   headers['Access-Control-Max-Age'] = '1000'
    #   headers['Access-Control-Allow-Headers'] = '*,x-requested-with'
    # end

    # def access_allowed?
    #   allowed_sites = [request.env['HTTP_ORIGIN']] #you might query the DB or something, this is just an example
    #   return allowed_sites.include?(request.env['HTTP_ORIGIN'])    
    # end
end