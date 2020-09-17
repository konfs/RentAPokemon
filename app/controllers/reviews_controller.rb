class ReviewsController < ApplicationController
    before_action :set_review, only: [:new, :create]

    def new
      @review = Review.new
    end
  
    def create
      review = Review.new(review_params)
      review.rental = @rental
      if review.save
        redirect_to pokemon_path(@rental.pokemon)
      else
        render new
      end
    end
    
    private
    def set_review
      @rental = Rental.find(params[:rental_id])
    end
  
    def review_params
      params.require(:review).permit([:description, :rating])
    end
end