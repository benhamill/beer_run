module ApplicationHelper
  def active_nav_li(text, path, options = {})
    render partial: 'shared/active_nav_li', locals: { path: path, text: text, options: options }
  end

  def alert_close
    render partial: 'shared/alert_close'
  end
end
