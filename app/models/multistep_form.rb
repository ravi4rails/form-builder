class MultistepForm < ApplicationRecord

  has_many :form_steps, inverse_of: :multistep_form
  accepts_nested_attributes_for :form_steps, reject_if: :all_blank, allow_destroy: true

  attr_writer :current_step

  def steps
    self.form_steps.pluck(:name)
  end

  def current_step
    @current_step || self.form_steps.pluck(:name).first
  end

  def next_step current_step
    steps = self.form_steps.pluck(:name)
    index = steps.find_index(current_step)
    if !index.nil?
      steps[index+1] || steps[0]
    end
  end

  def previous_step current_step
    steps = self.form_steps.pluck(:name)
    index = steps.find_index(current_step)
    if !index.nil?
      steps[index-1] || steps[steps.length - 1]
    end
  end

  def first_step
    current_step = self.form_steps.pluck(:name).first
  end

  def last_step
    current_step = self.form_steps.pluck(:name).last
  end

end
