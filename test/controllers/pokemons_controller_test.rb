require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    pokemons = Pokemon.all
    @pokemon = pokemons(:Bulbasaur)
  end

  test "should have all test pokemons pokemons in fixtures" do
    assert_equal 20, pokemons.length
  end

  test "should get all pokemons" do
    get '/pokemons?all=true'
    assert_response :success
    assert_equal pokemons.length, JSON.parse(@response.body).length
  end

  test "should get a page of pokemons" do
    get '/pokemons?page=1&per_page=10'
    assert_response :success
    assert_equal 10, JSON.parse(@response.body).length
  end

  test "should get a single pokemon" do
    get "/pokemons/#{@pokemon.id}"
    assert_response :success
    assert_equal @pokemon.name, JSON.parse(@response.body)["name"]
  end

  test "should create a new pokemon" do
    assert_difference('Pokemon.count') do
      post '/pokemons', params: {pokemon: { number: @pokemon.number, name: @pokemon.name, type1: @pokemon.type1, type2: @pokemon.type2, total: @pokemon.total, hp: @pokemon.hp, attack: @pokemon.attack, defense: @pokemon.defense, sp_atk: @pokemon.sp_atk, sp_def: @pokemon.sp_def, speed: @pokemon.speed, generation: @pokemon.generation, legendary: @pokemon.legendary }}
   end
  end

  test "should not edit an existing pokemon with invalid data" do
    patch "/pokemons/#{@pokemon.id}", params: {pokemon: { falseParameter: "Raichu" }}
    assert_equal 'Bulbasaur', pokemons(:Bulbasaur).reload.name
  end

  test "should edit an existing pokemon" do
    patch "/pokemons/#{@pokemon.id}", params: {pokemon: { name: "Raichu" }}
    #assert_redirected_to pokemon_path(assigns(:pokemon))
    assert_equal 'Raichu', pokemons(:Bulbasaur).reload.name
  end

  test "should delete a pokemon" do
    assert_difference('Pokemon.count', -1) do
      delete "/pokemons/#{@pokemon.id}"
    end
    assert_response :success
  end

end