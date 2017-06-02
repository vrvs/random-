class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def statistic
    @residues = Residue.all
    @laboratories = Laboratory.all
    @departments = Department.all
  end
  
end
