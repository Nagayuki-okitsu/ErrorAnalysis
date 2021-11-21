class HomesController < ApplicationController
  
  def analysis

    if params[:err_mess].present?
      @errorList = ErrorList.all
    else
      @errorList = ErrorList.none
    end
  end

end
