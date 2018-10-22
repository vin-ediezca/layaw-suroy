module ApplicationHelper

  def flash_list
    flash[:success] || flash[:info] || flash[:danger]
  end

end
