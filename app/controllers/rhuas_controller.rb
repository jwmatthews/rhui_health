class RhuasController < ApplicationController
  # GET /rhuas
  # GET /rhuas.json
  def index
    @rhuas = Rhua.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rhuas }
    end
  end

  # GET /rhuas/1
  # GET /rhuas/1.json
  def show
    @rhua = Rhua.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rhua }
    end
  end

  # GET /rhuas/new
  # GET /rhuas/new.json
  def new
    @rhua = Rhua.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rhua }
    end
  end

  # GET /rhuas/1/edit
  def edit
    @rhua = Rhua.find(params[:id])
  end

  # POST /rhuas
  # POST /rhuas.json
  def create
    @rhua = Rhua.new(params[:rhua])

    respond_to do |format|
      if @rhua.save
        format.html { redirect_to @rhua, notice: 'Rhua was successfully created.' }
        format.json { render json: @rhua, status: :created, location: @rhua }
      else
        format.html { render action: "new" }
        format.json { render json: @rhua.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rhuas/1
  # PUT /rhuas/1.json
  def update
    @rhua = Rhua.find(params[:id])

    respond_to do |format|
      if @rhua.update_attributes(params[:rhua])
        format.html { redirect_to @rhua, notice: 'Rhua was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rhua.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rhuas/1
  # DELETE /rhuas/1.json
  def destroy
    @rhua = Rhua.find(params[:id])
    @rhua.destroy

    respond_to do |format|
      format.html { redirect_to rhuas_url }
      format.json { head :no_content }
    end
  end
end
