class FontawesomeHookListener < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(_context = {})
    stylesheet_link_tag('fontawesome', :plugin => 'fontawesome', :media => 'all')
  end
end
