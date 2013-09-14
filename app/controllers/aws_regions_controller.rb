class AwsRegionsController < ApplicationController
  # GET /aws_regions
  # GET /aws_regions.json
  def index
    @aws_regions = AwsRegion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aws_regions }
    end
  end

  # GET /aws_regions/1
  # GET /aws_regions/1.json
  def show
    @aws_region = AwsRegion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aws_region }
    end
  end

  # GET /aws_regions/new
  # GET /aws_regions/new.json
  def new
    @aws_region = AwsRegion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aws_region }
    end
  end

  # GET /aws_regions/1/edit
  def edit
    @aws_region = AwsRegion.find(params[:id])
  end

  # POST /aws_regions
  # POST /aws_regions.json
  def create
    @aws_region = AwsRegion.new(params[:aws_region])

    respond_to do |format|
      if @aws_region.save
        format.html { redirect_to @aws_region, notice: 'Aws region was successfully created.' }
        format.json { render json: @aws_region, status: :created, location: @aws_region }
      else
        format.html { render action: "new" }
        format.json { render json: @aws_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aws_regions/1
  # PUT /aws_regions/1.json
  def update
    @aws_region = AwsRegion.find(params[:id])

    respond_to do |format|
      if @aws_region.update_attributes(params[:aws_region])
        format.html { redirect_to @aws_region, notice: 'Aws region was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aws_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_regions/1
  # DELETE /aws_regions/1.json
  def destroy
    @aws_region = AwsRegion.find(params[:id])
    @aws_region.destroy

    respond_to do |format|
      format.html { redirect_to aws_regions_url }
      format.json { head :no_content }
    end
  end
end
