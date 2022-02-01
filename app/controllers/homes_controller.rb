class HomesController < ApplicationController
  
  def analysis
    if params[:err_mess].present?
      @flg = true
    else
      @flg = false
    end
  end

end
