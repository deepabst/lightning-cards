class DecksController < ApplicationController

  before_action :check_if_logged_in
  
  def new
    @deck = Deck.new
  end # new
  
  def create

    # create a new deck with only a name
    @deck = Deck.new deck_params
    # associate the current user to the deck
    @deck.user_id = @current_user.id
    # save deck in the db
    @deck.save

    if @deck.persisted?
      redirect_to decks_path
    else
      render :new
    end # if @deck persisted
    
  end # create

  def index
    @decks = Deck.where(user_id: @current_user.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def deck_params
    params.require(:deck).permit(:name)
  end
  
  
end # class DecksController
