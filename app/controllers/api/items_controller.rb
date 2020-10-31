class Api::ItemsController < ApplicationController
  def index
    @items = Item.all
    render "index.json.jb"
  end

  def create
    @item = Item.new(
      name: params[:name],
      ingredients: params[:ingredients],
      price: params[:price],
    )
    @item.save
    render "show.json.jb"
  end

  def show
    @item = Item.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.name = params[:name] || @item.name
    @item.ingredients = params[:ingredients] || @item.ingredients
    @item.price = params[:price] || @item.price
    @item.save
    render "show.json.jb"
  end

  def destroy
    item = Item.find_by(id: params[:id])
    item.destroy
    render json: { message: "Item successfully deleted." }
  end
end
