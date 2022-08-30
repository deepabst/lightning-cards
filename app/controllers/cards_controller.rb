class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    @card = Card.new card_params
    # TODO: check if the deck id provided belongs to the current user (we got it from a form)
  end

  def index
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

  def card_params
    params.require(:card).permit(:front_text, :front_img, :back_text, :back_img, :category, :deck_id)
  end # card_params
end # class CardsController
