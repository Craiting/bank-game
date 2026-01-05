require "./player"

class Jeff < ::Player
  def initialize
    # Don't forget to set your name below
    super("Jeff")
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
    rounds_left = game_state[:total_rounds] - game_state[:round_number]
    high_score = game_state[:other_players][0][:score]
    score_diff = high_score - score
    potential_score = score + game_state[:pot_total]

    if game_state[:roll_count] < 5
      return false
    end
    if score > high_score
      if game_state[:pot_total] > 50
        return true
      end
    elsif potential_score > high_score
      return true
    end
    return false
  end

  private
  # Add any private methods to help with your strategy.
end
