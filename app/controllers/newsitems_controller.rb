class NewsitemsController < ApplicationController
  # GET /newsitems
  # GET /newsitems.json
  def index
    @newsitems = Newsitem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @newsitems }
    end
  end

  # GET /newsitems/1
  # GET /newsitems/1.json
  def show
    @newsitem = Newsitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newsitem }
    end
  end

  # GET /newsitems/new
  # GET /newsitems/new.json
  def new
    @newsitem = Newsitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newsitem }
    end
  end

  # GET /newsitems/1/edit
  def edit
    @newsitem = Newsitem.find(params[:id])
  end

  # POST /newsitems
  # POST /newsitems.json
  def create
    @newsitem = Newsitem.new(params[:newsitem])

    respond_to do |format|
      if @newsitem.save
        format.html { redirect_to @newsitem, notice: 'Newsitem was successfully created.' }
        format.json { render json: @newsitem, status: :created, location: @newsitem }
      else
        format.html { render action: "new" }
        format.json { render json: @newsitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /newsitems/1
  # PUT /newsitems/1.json
  def update
    @newsitem = Newsitem.find(params[:id])

    respond_to do |format|
      if @newsitem.update_attributes(params[:newsitem])
        format.html { redirect_to @newsitem, notice: 'Newsitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newsitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsitems/1
  # DELETE /newsitems/1.json
  def destroy
    @newsitem = Newsitem.find(params[:id])
    @newsitem.destroy

    respond_to do |format|
      format.html { redirect_to newsitems_url }
      format.json { head :no_content }
    end
  end
end
