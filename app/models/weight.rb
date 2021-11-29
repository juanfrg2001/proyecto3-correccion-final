class Weight < ActiveRecord::Base
  belongs_to :user
  validates :height, presence: true, numericality: {only_integer: true}
  validates :weight, presence: true, numericality: {only_integer: true}
  validates :years_old, presence: true, numericality: {only_integer: true}
  validates :sex, presence: true, length: {maximum: 1}
  validates :description_weight, presence: true
  validates :date_weight, presence: true


  def sumaWeight
    self.save if self.weight.nil?
    if self.sex == "F"
      self.update(info_calories: ((self.weight * 10)+(6*self.height)-(5*self.years_old)-161))
    else
      self.update(info_calories: ((self.weight * 10)+(6*self.height)-(5*self.years_old)+5))
    end

  end

end
