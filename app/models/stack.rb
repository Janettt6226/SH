class Stack < ApplicationRecord
  belongs_to :game
  TYPE = %i[liberal fasciste]
end
