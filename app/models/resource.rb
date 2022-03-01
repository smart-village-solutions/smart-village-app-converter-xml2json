class Resource < ApplicationRecord
  self.inheritance_column = :_type_disabled
end
