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

end
