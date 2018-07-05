require 'csv'

class BasicForm < ApplicationRecord
  # searchkick
  has_many :submissions, dependent: :destroy
  has_many :form_blocks, inverse_of: :basic_form
  has_many :form_steps, inverse_of: :basic_form 

  accepts_nested_attributes_for :form_steps, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :form_blocks, reject_if: :all_blank, allow_destroy: true

  has_many :multiple_choices, inverse_of: :form_step 
  has_many :checkbox_questions, inverse_of: :form_step
  has_many :dropdowns, inverse_of: :form_step
  accepts_nested_attributes_for :multiple_choices, reject_if: :all_blank, allow_destroy: true
  
  accepts_nested_attributes_for :checkbox_questions, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :dropdowns, reject_if: :all_blank, allow_destroy: true

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

  def self.to_csv submissions
    attributes = submissions.map {|submission| submission.form_values }
    
    attributes.each do |atr|
      atr.each do |key, val|
        if atr[key].class == Array
          val_array = atr[key].reject {|c| c.empty? }
          atr[key] = val_array
        end 
      end
    end
    
    column_names = attributes.first.keys

    CSV.generate do |csv|
      csv << column_names
      attributes.each do |attribute|
        csv << attribute.values
      end
    end

  end

end
