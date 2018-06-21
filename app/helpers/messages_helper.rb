module MessagesHelper

  def time_posted
    self.created_at.strftime("%A, %b %e %Y, %l:%m %p")
  end
  
end
