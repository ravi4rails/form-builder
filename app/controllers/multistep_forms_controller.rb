class MultistepFormsController < ApplicationController
  before_action :set_multistep_form, only: [:show, :edit, :update, :destroy]

  # GET /multistep_forms
  # GET /multistep_forms.json
  def index
    @multistep_forms = MultistepForm.all
  end

  # GET /multistep_forms/1
  # GET /multistep_forms/1.json
  def show
  end

  # GET /multistep_forms/new
  def new
    @multistep_form = MultistepForm.new
  end

  # GET /multistep_forms/1/edit
  def edit
  end

  # POST /multistep_forms
  # POST /multistep_forms.json
  def create
    @multistep_form = MultistepForm.new(multistep_form_params)

    respond_to do |format|
      if @multistep_form.save
        format.html { redirect_to @multistep_form, notice: 'Multistep form was successfully created.' }
        format.json { render :show, status: :created, location: @multistep_form }
      else
        format.html { render :new }
        format.json { render json: @multistep_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multistep_forms/1
  # PATCH/PUT /multistep_forms/1.json
  def update
    respond_to do |format|
      if @multistep_form.update(multistep_form_params)
        format.html { redirect_to @multistep_form, notice: 'Multistep form was successfully updated.' }
        format.json { render :show, status: :ok, location: @multistep_form }
      else
        format.html { render :edit }
        format.json { render json: @multistep_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multistep_forms/1
  # DELETE /multistep_forms/1.json
  def destroy
    @multistep_form.destroy
    respond_to do |format|
      format.html { redirect_to multistep_forms_url, notice: 'Multistep form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multistep_form
      @multistep_form = MultistepForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multistep_form_params
      params.require(:multistep_form).permit!
    end
end
