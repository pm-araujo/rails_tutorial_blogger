class MonthsController < ApplicationController
    def show
        @month = params[:id]
        if @month.to_i > 12
            redirect_to articles_path
        end
    end
end
