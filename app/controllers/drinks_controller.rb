class DrinksController < ApplicationController

  def index        
    option_search    
  end
  
  private
    def option_search
        if(params[:searchRadio] == 'simple')
           search_simples
        else 
           search_avancada
        end 
    end 
     
    def search_simples
      if params[:campo]
            @drinks = Drink.search_name(params[:campo])
      else
            @drinks = Drink.all.order(:name).page(params[:page]).per(5)
      end
    end

    def search_avancada
        @drinks = Drink
                    .search_alcohol_level(params[:alcohol_level])
                    .search_temperature(params[:temperature])
                    .search_ibu(params[:ibu])
    end
end
