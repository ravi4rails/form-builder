class BasicFormsController < ApplicationController
  before_action :set_basic_form, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:preview_form]
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
    @basic_form.form_steps.build
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
    if params[:step].present?
      @step = @basic_form.form_steps.find_by(name: params[:step])
    end
  end

  def collect_user_response

    form_block_ids = {}
    
    @basic_form = BasicForm.find(params[:user_response][:basic_form_id])
        
    @user = User.find(params[:user_response][:user_id])
    
    total_response_value = params[:user_response]
    
    submission_values = {"user_id" => params[:user_response][:user_id], "basic_form_id" => params[:user_response][:basic_form_id], "step_name" => params[:user_response][:step_name], "submission_id" => params[:user_response][:submission_id]}

    puts submission_values

    @step_name = params[:user_response][:step_name]

    @form_step = @basic_form.form_steps.find_by(name: @step_name)
    
    form_block_values = total_response_value.dup.delete_if {|k,_| submission_values.key?(k)}
    
    form_block_values.each {|k, v| puts form_block_ids[k] = v if k.include? "form_block_"}
    
    puts form_block_ids
    
    form_block_values = total_response_value.dup.delete_if {|k,_| submission_values.merge(form_block_ids).key?(k)}
    
    puts form_block_values
    
    @next_step = @basic_form.next_step(@step_name)

    if params[:user_response][:submission_id].present?
      @submission = Submission.find(params[:user_response][:submission_id])
      submission_form_values = @submission.form_values
      new_submission_form_values = total_response_value.dup.delete_if {|k,_| submission_values.key?(k)}
      updated_submission_form_values = form_block_values.merge(submission_form_values)
      respond_to do |format|
        if @submission.update(form_values: updated_submission_form_values)
          form_block_ids.each do |key, val| 
            form_block = FormBlock.find(val)
            lab = form_block.label.downcase
            user_response_value = @user.user_response_values.create(form_block_id: form_block.id, form_block_value: form_block_values[lab], submission_id: @submission.id)
          end
          completed_steps = @submission.steps_completed
          if @submission.steps_completed < @basic_form.form_steps.count
            @submission.update(steps_completed: completed_steps+1) 
          end
          if @submission.steps_completed == @basic_form.form_steps.count
            format.html { redirect_to basic_form_path(@basic_form), notice: 'your response has been collected successfully. Thanks for responding :)' }
          else 
            format.html { redirect_to preview_form_basic_form_path(@basic_form.id, step: @next_step, submission_id: @submission.id), notice: 'your response for this this step has been collected successfully. Please respond for next step :)' }
          end
        end
      end
    else
      @submission = Submission.new(user_id: @user.id, basic_form_id: @basic_form.id, form_values: form_block_values)
      respond_to do |format|
        if @submission.save 
          form_block_ids.each do |key,val| 
            form_block = FormBlock.find(val)
            lab = form_block.label.downcase
            user_response_value = @user.user_response_values.create(form_block_id: form_block.id, form_block_value: form_block_values[lab], submission_id: @submission.id)
          end
          completed_steps = @submission.steps_completed
          if @submission.steps_completed < @basic_form.form_steps.count
            @submission.update(steps_completed: completed_steps+1) 
          end
          if @submission.steps_completed == @basic_form.form_steps.count
            format.html { redirect_to basic_form_path(@basic_form), notice: 'your response has been collected successfully. Thanks for responding :)' }
          else
            format.html { redirect_to preview_form_basic_form_path(@basic_form.id, step: @next_step, submission_id: @submission.id), notice: 'your response for this this step has been collected successfully. Please respond for next step :)' }
          end
        end
      end
    end

  end

  def submissions
    @basic_form = BasicForm.find(params[:id])
    @submissions = @basic_form.submissions

    respond_to do |format|
      format.html
      format.csv {send_data BasicForm.to_csv(@submissions), filename: "Submission-#{BasicForm.name}.csv"}
    end

  end

  def sort_blocks
    params[:order].each do |key,value|
      FormBlock.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  def sort_multiple_choices
    params[:order].each do |key, value|
      MultipleChoice.find(value[:id]).update_attribute(:priority, value[:position])
    end
    render nothing: true
  end

  def sort_checkbox_questions
    params[:order].each do |key, value|
      CheckboxQuestion.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render nothing: true
  end

  def sort_dropdowns
    params[:order].each do |key, value|
      Dropdown.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_form
      @basic_form = BasicForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_form_params
      params.require(:basic_form).permit!
    end

    def submission_params
      params.require(:user_response).permit(:user_id, :basic_form_id)
    end
end
