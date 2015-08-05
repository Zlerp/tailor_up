class TailorsController < ApplicationController


  # def about_tailor
  #   @tailors = Tailors.all
  # end
  #
  # def company_index
  #   @tailors = current_company.tailors.all
  # end
  #
  #



  # def destroy
  #   @tailor = current_company.tailors.find(params[:id])
  #   @tailor.destroy
  #   redirect_to companies_path
  # end

  def view
    @tailor = current_company.tailors.find(params[:id])
  end

end
