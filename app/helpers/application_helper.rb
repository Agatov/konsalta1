module ApplicationHelper
  def get_time time
    if time.year == Date.today.year
      Russian::strftime(time, "%H:%I, %d %B")
    else
      Russian::strftime(time, "%H:%I, %d %B %Y")
    end
  end
end
