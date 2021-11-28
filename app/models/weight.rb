class Weight < ActiveRecord::Base
  belongs_to :user





  def sumaWeight
    self.save if self.weight.nil?
    if self.sex == "F"
      self.update(info_calories: ((self.weight * 10)+(6*self.height)-(5*self.years_old)-161))
    else
      self.update(info_calories: ((self.weight * 10)+(6*self.height)-(5*self.years_old)+5))
    end

  end

end
