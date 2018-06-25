class MultistepSubmissionsController < ApplicationController 

  def multistep_form_preview
    @multistep_form = MultistepForm.find(params[:form_id])

    if params[:step].present?
      @step = @multistep_form.form_steps.find_by(name: params[:step])
    end 

  end

end