class HomesController < ApplicationController
  
  def analysis

    if params[:err_mess].present?

      @flg = true
      @err_list = []

      err_list = open("#{Rails.root}/app/controllers/errorList.yml","r") { |f| YAML.load(f) } 
      err_list.each do |err|
        if params[:err_mess].include?(err["err_mess"])
          @err_list.push(err)
        end
      end

    else

      @flg = false
    end


  end

end
