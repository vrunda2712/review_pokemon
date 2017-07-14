class PokemonController < ApplicationController

  def index
    max_per_page = 15
    offset = 0
    @pokemon = []

    while offset < 100 do
      pokemon_response = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/?limit=#{max_per_page}&offset=#{offset}")
      # @pokemon = pokemon_response.body
      pokemon_json_data = pokemon_response.body
      @pokemon_data = JSON.parse(pokemon_json_data)
      @pokemon.concat(@pokemon_data["results"])

      offset += 15
    end

  end
end
