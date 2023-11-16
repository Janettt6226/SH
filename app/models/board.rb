class Board < ApplicationRecord
  belongs_to :game

  def victory
    if liberal.count == 6
      @result = "Les libéraux ont gagné"
    elsif fascist.count == 5
      @result = "Les fascistes ont gagné"
    elsif fascist.count >= 4 && @player.role == "hitler" && hitler == @chancelier
      @result = "Les fascistes ont gagné"
    else
      @result = "Passer au prochain round"
  end

  def bonus
    case @count = fascist.count
    when @count == 2
      @bonus = "Le président peut regarder la carte d'un joueur"
    when @count == 3
      @bonus = "Gouvernement imaginaire !"
    when @count == 4
      @bonus = "Le président peut tuer un joueur"
    when @count == 6
      @bonus = "Droit de veto !"
  end

end
