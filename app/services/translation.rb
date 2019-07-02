# frozen_string_literal: true

class Translation
  def self.weekday(day)
    return "" if day.blank?

    case day
    when "monday"
      "Montag"
    when "tuesday"
      "Dienstag"
    when "wednesday"
      "Mittwoch"
    when "thursday"
      "Donnerstag"
    when "friday"
      "Freitag"
    when "saturday"
      "Samstag"
    when "sunday"
      "Sonntag"
    when "sunday_holiday"
      "Sonntag"
    when "newYear"
      "01.01. (Neujahr)"
    when "laborDay"
      "01.05. (Tag der Arbeit)"
    when "germanUnity"
      "03.10. (Tag der deutschen Einheit)"
    when "christmasEve"
      "24.12. (Heiligabend)"
    when "firstChristmasDay"
      "25.12. (1. Weihnachtsfeiertag)"
    when "secondChristmasDay"
      "26.12. (2. Weihnachtsfeiertag)"
    when "silvester"
      "31.12. (Silvester)"
    when "goodFriday"
      "Karfreitag"
    when "easterSunday"
      "Ostersonntag"
    when "easterMonday"
      "Ostermontag"
    when "ascensionDay"
      "Himmelfahrt"
    when "whitSunday"
      "Pfingstsonntag"
    when "whitMonday"
      "Pfingstmontag"
    when "reformationDay"
      "31.10. (Reformationstag)"
    end
  end

  # Bei Auswahl der Kategorien „other“ und „discount“ wird hier die Kategorie frei benannt:
  # category wird dann gesetzt durch den Wert von categorytext
  def self.price_category(price_category, category_text)
    return nil if price_category.blank?

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
