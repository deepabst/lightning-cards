class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    @card = Card.new card_params
    # TODO: check if the deck id provided belongs to the current user (we got it from a form)
    @card.save # creates new card in db

    if @card.persisted?
      redirect_to deck_path(@card.deck_id)
    else
      render :new
    end # if
  end # create

  def index
  end

  def show
    @card = Card.find params[:id]
    if @card.deck.user_id != @current_user.id
      redirect_to root_path
    end
  end

  def edit
    @card = Card.find params[:id]
  end

  def update
    card = Card.find params[:id]
    card.update card_params
    redirect_to card_path(card.id)
  end

  def destroy
    Card.destroy params[:id]
    redirect_back(fallback_location: root_path)
  end

  # method to update the user confidence on a card
  def confidence
    # find the card to update
    card = Card.find params[:id]
    puts "Card: #{card.id} - #{card.front_text} F-Confidence score: #{card.front_confidence}"

    # increase/decrease card confidence
    card.front_confidence += params[:num].to_i

    # enforce boundary 0 - 3 for card confidence
    if card.front_confidence > 3
      card.front_confidence = 3
    end

    if card.front_confidence < 0
      card.front_confidence = 0
    end

    card.save
    puts "*****************confidence altered***********************"
    puts "Card: #{card.id} - #{card.front_text} F-Confidence score: #{card.front_confidence}"

    # redirect to play path
    redirect_to play_path(id: card.deck.id)
  end

  private

  def card_params
    params.require(:card).permit(:front_text, :front_img, :back_text, :back_img, :category, :deck_id, :front_confidence)
  end # card_params
end # class CardsController
