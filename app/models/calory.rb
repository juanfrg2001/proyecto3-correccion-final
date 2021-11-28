class Calory < ActiveRecord::Base
  belongs_to :user
  scope :having_dob_between, ->(start_date, end_date) { where(dob: start_date..end_date) }
  self.inheritance_column = nil

  enum type: [:burned, :gained]


end
