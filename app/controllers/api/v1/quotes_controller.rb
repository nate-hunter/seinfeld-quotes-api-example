module Api
  module V1
    class QuotesController < ApplicationController
      # Helper method not created because I was pasting code snippets into a Medium article.
      def index
        quotes = Quote.all
        render json: {status: 'SUCCESS', message: 'Loaded quotes', data: quotes}, status: :ok
      end

      def show
        quote = Quote.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Your quote loaded', data: quote}, status: :ok
      end

      def create
        quote = Quote.new(quote_params)

        if quote.save
          render json: {status: 'SUCCESS', message: 'Created a new quote', data: quote}, status: :ok
        else
          render json: {status: 'ERROR', message: 'A new quote was not able to be created', data: quote.errors}, status: :unproccessable_entity
        end
      end

      def update
        quote = Quote.find(params[:id])

        if quote.update(quote_params)
          render json: {status: 'SUCCESS', message: 'Updated quote', data: quote}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Quote not updated', data: quote.errors}, status: :unproccessable_entity
        end
      end

      def destroy
        quote = Quote.find(params[:id])
        quote.destroy
        render json: {status: 'SUCCESS', message: 'Quote successfully deleted', data: quote}, status: :ok
      end

      private

      def quote_params
        params.permit(:character, :quote, :episode)
        # params.require(:quote).permit(:character, :quote, :episode)
      end

    end
  end
end
