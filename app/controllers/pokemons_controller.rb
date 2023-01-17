class PokemonsController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        per_page = params[:per_page] || 10
        page = params[:page] || 1
        all = params[:all]
    
        if all
            @pokemons = Pokemon.all
        else
            @pokemons = Pokemon.paginate(:page => page, :per_page => per_page)
        end
        render json: @pokemons
    end
    
    def show
        @pokemon = Pokemon.find(params[:id])
        render json: @pokemon
    end
    
    def create
        @pokemon = Pokemon.new(pokemon_params)
        if @pokemon.save
            render json: @pokemon, status: :created
        else
            render json: @pokemon.errors, status: :unprocessable_entity
        end
    end
    
    def update
        @pokemon = Pokemon.find(params[:id])
        if @pokemon.update(pokemon_params)
            render json: @pokemon
        else
            render json: @pokemon.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @pokemon = Pokemon.find(params[:id])
        @pokemon.destroy
        head :no_content
    end
    
    private
        def pokemon_params
            params.require(:pokemon).permit(:name, :type1, :type2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
        end
    end