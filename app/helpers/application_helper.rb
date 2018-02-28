module ApplicationHelper
  def date_format(date)
    date.strftime('%e %B %Y, %H:%M')
  end
end
