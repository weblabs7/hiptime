class ItemsController < ApplicationController
    
    def index
        @items = Item.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    private
    
    def item_params
        params.require(:item).permit(:title, :description)
    end
    
    def find_item
        @item = Item.find(params[:id])
    end
    
end
