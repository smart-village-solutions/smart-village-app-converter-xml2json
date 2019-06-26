# frozen_string_literal: true

class Translation
  def self.weekdays(day)
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

end
