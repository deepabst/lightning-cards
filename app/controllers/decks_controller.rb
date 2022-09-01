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
    # check the user owns this deck (bad actor might have guessed the url)
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
    @deck = Deck.find params[:id]
    # decide what confidence level card to show next 0,1,2,3

    #TODO: move this card selection logic into the Deck model.
    nextCard = nil
    # as some confidence buckets may be empty
    # iterate til there is a next card to show
    # performance issue - more iterations
    # as the user improves since there is only a
    # 5% chance of seeing high confidence cards
    while nextCard == nil
      d100 = rand(1..100)
      case d100
      when 95..100
        # select from confidence level 3
        nextCard = Card.where(deck_id: @deck.id).where(front_confidence: 3).sample
      when 81..95
        # select from confidence level 2
        nextCard = Card.where(deck_id: @deck.id).where(front_confidence: 2).sample
      when 51..80
        # select from confidence level 1
        nextCard = Card.where(deck_id: @deck.id).where(front_confidence: 1).sample
      else
        # select from confidence level 0
        nextCard = Card.where(deck_id: @deck.id).where(front_confidence: 0).sample
      end # switch case
    end # while loop
    @card = nextCard
    # randomly select another card in the deck
  end # play method

  private

  def deck_params
    params.require(:deck).permit(:name)
  end

  # TODO: move check deck ownership code to a separate private method and run before anything else

end # class DecksController
