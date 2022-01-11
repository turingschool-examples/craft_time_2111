class Person
  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @interests = attributes.fetch(:interests)
    @supplies = Hash.new(0)
  end

  def add_supply(object, count)
      @supplies[object] += count
    end
  end






#
#     [object] ||= (how_many)
#   end
# end
# add_away_games = ab.each do |game|
#       if games_hash.has_key?(game.away_team_id) ; games_hash[game.away_team_id] << game
#     end
#   end
# # wins_hashed = {}
#   games_hashed_by_opponent.each do |opponent, games|
#     wins_hashed[opponent] ||= []
#     games.select do |game|
#                     wins_hashed[opponent] <<  game.away_goals
#                     wins_hashed[opponent] <<  game.away_team_id
#                     wins_hashed[opponent] <<  game.home_goals
#                     wins_hashed[opponent] <<  game.home_team_id
#                   end.flatten
