class DosesController < ApplicationController
 before_action :set_cocktail

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(review_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:dose).permit(:description)
  end

end

