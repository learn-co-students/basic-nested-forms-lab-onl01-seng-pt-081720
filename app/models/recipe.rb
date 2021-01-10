class Recipe < ActiveRecord::Base
  has_many :ingredients

  def ingredients_attributes=(attrs)
    attrs.each do |attr|
      if !attr[1][:name].empty?
        self.ingredients.build(name: attr[1][:name], quantity: attr[1][:quantity])
      end
    end
  
  end

end
