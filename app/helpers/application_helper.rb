module ApplicationHelper
  def active_nav_li(text, path)
    render partial: 'shared/bootstrap_active_nav_li', locals: { path: path, text: text }
  end
end
