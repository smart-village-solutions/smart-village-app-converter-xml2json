# frozen_string_literal: true

class Translation
  def self.price_category(price)
    price = price.at_xpath("category").try(:text)

    case price
    when "children"
      "Kinder"
    when "adult"
      "Erwachsene"
    when "group"
      "Gruppen"
    when "family"
      "Familien"
    when "senior"
      "Senioren"
    when "reduced"
      "Ermäßigt"
    when "discount", "other"
      price.at_xpath("categorytext").try(:text)
    end
  end
end
