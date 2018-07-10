module ApplicationHelper
  def get_option_id(name)
    @checkbox_option = CheckboxOption.find_by(option: name)
    @checkbox_option.id
  end
end
