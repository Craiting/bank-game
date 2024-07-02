require "./player"

class Craig < ::Player
  def initialize
    super("Craig")
  end

  # {
  #   :total_rounds => 10,
  #   :round_number => 1,
  #   :roll_count => 1,
  #   :pot_total => 10,
  #   :last_roll => [5, 5],
  #   :players => [
  #     { 
  #       :name => "Lameo",
  #       :score => 0,
  #       :in_the_round => true
  #     },
  #     { 
  #       :name => "Dummy",
  #       :score => 0,
  #       :in_the_round => true
  #       }
  #     ],
  #   # other_players is all players other than yourself and it's in descending 
  #   # order where the person currently winning is at the top.
  #   :other_players => [
  #     {
  #       :name => "Lameo",
  #       :score => 0,
  #       :in_the_round => true
  #     }
  #   ]
  # }

  # must return boolean
  def cash_out?(game_state)
    max_score = game_state[:other_players][0][:score]
    potential_score = score + game_state[:pot_total]
    return true if game_state[:round_number] == 1 && potential_score > 35
    if score < 750 && potential_score > 750
      return true
    elsif score > 750 && game_state[:pot_total] > 100
      return true
    else
      return false
    end
  end

  private
  # Add any private methods to help with your strategy.
end
