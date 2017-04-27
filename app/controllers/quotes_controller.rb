class QuotesController < ApplicationController


  def index

  end

  def new
    # create a new quote
    @quote = Quote.new
  end

  def create 
    # save a new quote in the database
    @quote = Quote.create(quote_params)
    
    if @quote.valid?
      redirect_to root_path
      flash[:success] = '<strong>Your quote has been successfully created!</strong> Your quote is waiting for the approval.'
    else
      flash[:error] = '<strong>Could not save</strong>, the data you entered is invalid.'
      redirect_to new_quote_path
    end

  end 

  def about

  end

  def admin

  end

  private

  def quote_params
    params.require(:quote).permit(:author, :saying)
  end

end
