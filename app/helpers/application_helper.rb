module ApplicationHelper
  def flash_notice
    if flash[:notice]
      render :partial => "application/flash_notice"
    end
  end

  def flash_alert
    if flash[:alert]
      render :partial => "application/flash_alert"
    end
  end
end
