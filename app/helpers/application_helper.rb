module ApplicationHelper
  def time(time)
    time.strftime("%b %d, %I:%M%P")
  end
end
