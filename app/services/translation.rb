# frozen_string_literal: true

class Translation
  # Bei Auswahl der Kategorien „other“ und „discount“ wird hier die Kategorie frei benannt:
  # category wird dann gesetzt durch den Wert von categorytext
  def self.price_category(price_category, category_text)
    case price_category
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
      category_text
    end
  end
end
