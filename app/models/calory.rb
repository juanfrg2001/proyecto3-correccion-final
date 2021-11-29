class Calory < ActiveRecord::Base
  belongs_to :user
  scope :having_dob_between, ->(start_date, end_date) { where(dob: start_date..end_date) }
  self.inheritance_column = nil
  validates :comment_calory , presence: true
  validates :date_calory , presence: true
  validates :cont_calories , presence: true
  validates :description_calory , presence: true

  enum type: [:burned, :gained]


end
