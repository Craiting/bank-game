require "./player"

class Agro < ::Player
  def initialize
    super("Agro")
  end

  # must return boolean
  def cash_out?(game_state)
    max_score = game_state[:other_players][0][:score]
    potential_score = score + game_state[:pot_total]
    return true if potential_score > max_score
  end

  private
  # Add any private methods to help with your strategy.
end
