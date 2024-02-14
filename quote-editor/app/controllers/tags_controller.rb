class TagController < ApplicationController
    before_action :set_quote
  
    def new
      @tag = @quote.tags.build
    end
  
    def create
      @tag = @quote.tag.build(tag_params)
  
      if @tag.save
        redirect_to quote_path(@quote), notice: "Tag was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def tag_params
      params.require(:tag).permit(:name)
    end
  
    def set_quote
      @quote = current_company.quotes.find(params[:quote_id])
    end
  end
