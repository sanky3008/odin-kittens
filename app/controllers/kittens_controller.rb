class KittensController < ApplicationController
  before_action :set_kitten, only: %i[ show edit update destroy ]

  # GET /kittens or /kittens.json
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  # GET /kittens/1 or /kittens/1.json
  def show
    @kitten = set_kitten

    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  # GET /kittens/new
  def new
    @kitten = Kitten.new
  end

  # GET /kittens/1/edit
  def edit
  end

  # POST /kittens or /kittens.json
  def create
    @kitten = Kitten.new(kitten_params)

    # respond_to do |format|
      if @kitten.save
        flash[:message] = "Kitten was successfully created."
        redirect_to @kitten
        # format.html { redirect_to @kitten, notice: "Kitten was successfully created." }
        # format.json { render :show, status: :created, location: @kitten }
      else
        flash[:message] = "hag diya bro"
        render :new
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /kittens/1 or /kittens/1.json
  def update
    # respond_to do |format|
      if @kitten.update(kitten_params)
        redirect_to @kitten
        flash[:message] = "Kitten was successfully updated."
        # format.json { render :show, status: :ok, location: @kitten }
      else
        render :edit
        flash[:message] = "hag diya bro"
        # format.html { render :edit, status: :unprocessable_entity, :message = "hag diya bro" }
        # format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /kittens/1 or /kittens/1.json
  def destroy
    @kitten.destroy!

    # respond_to do |format|
      redirect_to kittens_path
      flash[:message] = "Successfully deleted"
      # format.html { redirect_to kittens_path, status: :see_other, notice: "Kitten was successfully destroyed." }
      # format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
