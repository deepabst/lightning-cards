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
    @deck = Deck.find params[:id]
    # check the user owns this deck (might have guessed the url)
    if @deck.user_id != @current_user.id
      flash[:error] = "Deck not found"
      redirect_to decks_path
    end
  end # show

  def edit
    # edit a deck name
    @deck = Deck.find params[:id]
    if @deck.user_id != @current_user.id
      flash[:error] = "Deck not found"
      redirect_to decks_path
    end
  end

  def update
    deck = Deck.find params[:id]
    if deck.user_id != @current_user.id
      flash[:error] = "Deck not found"
      redirect_to decks_path
    else
      deck.update deck_params
      redirect_to deck_path(deck.id)
    end
  end

  def destroy
    # check if this deck belongs to the current user, if true delete it
    @deck = Deck.find params[:id]
    # check the user owns this deck (might have guessed the url)
    if @deck.user_id != @current_user.id
      flash[:error] = "Deck not found"
    else
      Deck.destroy params[:id]
    end
    redirect_to decks_path
  end

  def play
    puts "LETS PLAYYYYYYYYYYYYYYYYY"
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end

  # TODO: move check deck ownership code to a separate private method and run before anything else

end # class DecksController
