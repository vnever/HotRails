class HashTagsController < ApplicationController
    before_action :set_quote
    before_action :set_hash_tag, only: [:edit, :update, :destroy]

    def new
        @hash_tag = @quote.hash_tags.build
    end

    def create
        @hash_tag = @quote.hash_tags.build(hash_tag_params)
        if @hash_tag.save
            respond_to do |format|
              format.html { redirect_to quote_path(@quote), notice: "Hashtag was successfully created." }
              format.turbo_stream { flash.now[:notice] = "Hashtag was successfully created." }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end
    
    def update
        if @hash_tag.update(hash_tag_params)
          respond_to do |format|
            format.html { redirect_to quote_path(@quote), notice: "Hashtag was successfully updated." }
            format.turbo_stream { flash.now[:notice] = "Hashtag was successfully updated." }
          end
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @hash_tag.destroy
      
        respond_to do |format|
          format.html { redirect_to quote_path(@quote), notice: "Hashtag was successfully destroyed." }
          format.turbo_stream { flash.now[:notice] = "Hashtag was successfully destroyed." }
        end
    end

    private
    
    def hash_tag_params
        params.require(:hash_tag).permit(:name)
    end
    
    def set_quote
        @quote = current_company.quotes.find(params[:quote_id])
    end

    def set_hash_tag
        @hash_tag = @quote.hash_tags.find(params[:id])
    end
end
