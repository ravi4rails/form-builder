class MultistepSubmissionsController < ApplicationController 

  def multistep_form_preview
    @multistep_form = MultistepForm.find(params[:form_id])

    if params[:step].present?
      @step = @multistep_form.form_steps.find_by(name: params[:step])
    end 

  end

  def save_multiplestep_form
    
    form_block_ids = {}
    
    @multistep_form = MultistepForm.find(params[:user_response][:multistep_form_id])
        
    @user = User.find(params[:user_response][:user_id])
    
    total_response_value = params[:user_response]
    
    submission_values = {"user_id" => params[:user_response][:user_id], "multistep_form_id" => params[:user_response][:multistep_form_id], "step_name" => params[:user_response][:step_name], "submission_id" => params[:user_response][:submission_id]}

    puts submission_values

    @step_name = params[:user_response][:step_name]

    @form_step = @multistep_form.form_steps.find_by(name: @step_name)
    
    form_block_values = total_response_value.dup.delete_if {|k,_| submission_values.key?(k)}
    
    form_block_values.each {|k, v| puts form_block_ids[k] = v if k.include? "form_block_"}
    
    puts form_block_ids
    
    form_block_values = total_response_value.dup.delete_if {|k,_| submission_values.merge(form_block_ids).key?(k)}
    
    puts form_block_values
    
    @next_step = @multistep_form.next_step(@step_name)

    form_block_ids.each do |key, val| 
      form_block = FormBlock.find(val)
      lab = form_block.label.downcase
      user_response_value = @user.user_response_values.create(form_block_id: form_block.id, form_block_value: form_block_values[lab])
    end

    if params[:user_response][:submission_id].present?
      @submission = Submission.find(params[:user_response][:submission_id])
      submission_form_values = @submission.form_values
      new_submission_form_values = total_response_value.dup.delete_if {|k,_| submission_values.key?(k)}
      updated_submission_form_values = form_block_values.merge(submission_form_values)
      respond_to do |format|
        if @submission.update(form_values: updated_submission_form_values)
          completed_steps = @submission.steps_completed
          if @submission.steps_completed < @multistep_form.form_steps.count
            @submission.update(steps_completed: completed_steps+1) 
          end
          if @submission.steps_completed == @multistep_form.form_steps.count
            format.html { redirect_to multistep_form_path(@multistep_form), notice: 'your response has been collected successfully. Thanks for responding :)' }
          else
            format.html { redirect_to form_preview_path(form_id: @multistep_form.id, step: @next_step, submission_id: @submission.id), notice: 'your response for this this step has been collected successfully. Please respond for next step :)' }
          end
        end
      end
    else
      @submission = Submission.new(user_id: @user.id, multistep_form_id: @multistep_form.id, form_values: form_block_values)
      respond_to do |format|
        if @submission.save 
          completed_steps = @submission.steps_completed
          if @submission.steps_completed < @multistep_form.form_steps.count
            @submission.update(steps_completed: completed_steps+1) 
          end
          if @submission.steps_completed == @multistep_form.form_steps.count
            format.html { redirect_to multistep_form_path(@multistep_form), notice: 'your response has been collected successfully. Thanks for responding :)' }
          else
            format.html { redirect_to form_preview_path(form_id: @multistep_form.id, step: @next_step, submission_id: @submission.id), notice: 'your response for this this step has been collected successfully. Please respond for next step :)' }
          end
        end
      end
    end
  end

end
