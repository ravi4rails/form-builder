class BasicFormsController < ApplicationController
  before_action :set_basic_form, only: [:show, :edit, :update, :destroy]

  # GET /basic_forms
  # GET /basic_forms.json
  def index
    @basic_forms = BasicForm.all
  end

  # GET /basic_forms/1
  # GET /basic_forms/1.json
  def show
  end

  # GET /basic_forms/new
  def new
    @basic_form = BasicForm.new
  end

  # GET /basic_forms/1/edit
  def edit
  end

  # POST /basic_forms
  # POST /basic_forms.json
  def create
    @basic_form = BasicForm.new(basic_form_params)

    respond_to do |format|
      if @basic_form.save
        format.html { redirect_to @basic_form, notice: 'Basic form was successfully created.' }
        format.json { render :show, status: :created, location: @basic_form }
      else
        format.html { render :new }
        format.json { render json: @basic_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basic_forms/1
  # PATCH/PUT /basic_forms/1.json
  def update
    respond_to do |format|
      if @basic_form.update(basic_form_params)
        format.html { redirect_to @basic_form, notice: 'Basic form was successfully updated.' }
        format.json { render :show, status: :ok, location: @basic_form }
      else
        format.html { render :edit }
        format.json { render json: @basic_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basic_forms/1
  # DELETE /basic_forms/1.json
  def destroy
    @basic_form.destroy
    respond_to do |format|
      format.html { redirect_to basic_forms_url, notice: 'Basic form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview_form
    @basic_form = BasicForm.find(params[:id])
  end

  def collect_user_response
    @basic_form = BasicForm.find(params[:user_response][:basic_form_id])
    @user = User.find(params[:user_response][:user_id])
    
    total_response_value = params[:user_response]
    
    submission_values = {"user_id" => params[:user_response][:user_id], "basic_form_id" => params[:user_response][:basic_form_id]}
    
    form_block_values = total_response_value.dup.delete_if {|k,_| submission_values.key?(k)}
    
    form_block_ids = @basic_form.form_blocks.ids
    
    @submission = Submission.new(user_id: @user.id, basic_form_id: @basic_form.id, form_values: form_block_values)
    
    respond_to do |format|
      if @submission.save 
        format.html { redirect_to @basic_form, notice: 'your response has been collected successfully. Thanks for responding :)' }
      end
    end
    
    # form_block_values.each do |key, val|
    #   user_field_value = UserFieldValue.create(value: val, user_id: @user.id )
    # end

    # form_block_ids.each do |fbi|

    # end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_form
      @basic_form = BasicForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_form_params
      params.require(:basic_form).permit(:name, :description, form_blocks_attributes: [:id, :label, :field_type, :is_required, :_destroy])
    end

    def submission_params
      params.require(:user_response).permit(:user_id, :basic_form_id)
    end
end
