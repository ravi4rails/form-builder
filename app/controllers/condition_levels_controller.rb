class ConditionLevelsController < ApplicationController

  def dropdown_conditional_block
    @dropdown = Dropdown.find(params[:dropdown_id])
    @dropdown_option = DropdownOption.find(params[:dropdown_option_id])
    respond_to do |format|
      format.js
    end
  end

  def form_block_conditional_block
    @form_block = FormBlock.find(params[:form_block_id])
    respond_to do |format|
      format.js
    end
  end

  def mcq_conditional_block
    @mcq_option = McqOption.find(params[:mcq_option_id])
    respond_to do |format|
      format.js
    end
  end

  def checkbox_conditional_block
    if params[:checked_option_id].present? 
      @checkbox_option = CheckboxOption.find(params[:checked_option_id])
    elsif params[:unchecked_option_id].present?
      @checkbox_option = CheckboxOption.find(params[:unchecked_option_id])
    end
    respond_to do |format|
      format.js
    end
  end

end
