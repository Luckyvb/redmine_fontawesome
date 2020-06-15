require_dependency 'fontawesome_hook_listener'

Redmine::Plugin.register :fontawesome do
  name 'Font Awesome plugin'
  author '!Lucky'
  description 'Add support for font awesome classes'
  version '0.0.1'
  url 'https://github.com/redmine_fontawesome'
  author_url 'https://github.com/Luckyvb'

  settings partial: 'settings/fas',
    default: {
      'menu' => {
        'top' => {
          'home' => {
            'replace' => 'false',
            'first' => 'true',
            'after' => nil,
            'last' => nil,
            'css' => 'fa fa-home'
          },
          'my' => {
            'replace' => 'false',
            'first' => nil,
            'after' => 'home',
            'last' => nil,
            'css' => 'fa fa-tachometer-alt'
          },
          'projects' => {
            'replace' => 'false',
            'first' => nil,
            'after' => 'my',
            'last' => nil,
            'css' => 'fa fa-cubes'
          },
          'administration' => {
            'replace' => 'false',
            'first' => nil,
            'after' => nil,
            'last' => 'true',
            'css' => 'fa fa-cogs'
          },
          'help' => {
            'replace' => 'false',
            'first' => nil,
            'after' => nil,
            'last' => 'true',
            'css' => 'fa fa-question-circle'
          }
        },
        'account' => {
          'login' => {
            'replace' => 'false',
            'first' => nil,
            'after' => nil,
            'last' => nil,
            'css' => 'fa fa-sign-in-alt'
          },
          'register' => {
            'replace' => 'false',
            'first' => nil,
            'after' => nil,
            'last' => nil,
            'css' => 'fa fa-user-plus'
          },
          'my_account' => {
            'replace' => 'false',
            'first' => nil,
            'after' => nil,
            'last' => nil,
            'css' => 'fa fa-user'
          },
          'logout' => {
            'replace' => 'false',
            'first' => nil,
            'after' => nil,
            'last' => nil,
            'css' => 'fa fa-sign-out-alt'
          }
        }
      }
    }

  s = settings[:default]['menu'].deep_merge(settings['menu'] ||= {})
#  if s['top']['my']['replace'].to_s.downcase == "true"
#    delete_menu_item :top_menu, :my_page
#    menu :top_menu, :my_page, {:controller => 'my', :action => 'page'}, :caption => '', html: {:class=> s['top']['my']['css'], :title=>I18n.t(:label_my_page)}, first: s['top']['my'][:first], last: s['top']['my'][:last], after: s['top']['my'][:after], if: Proc.new { User.current.logged? }
#  end
#  if s['top']['projects']['replace'].to_s.downcase == "true"
#    delete_menu_item :top_menu, :projects
#    menu :top_menu, :projects, {:controller => 'projects', :action => 'index'}, :caption => '', html: {:class=> s['top']['projects']['css'], :title=>I18n.t(:label_projects)}, first: s['top']['projects'][:first], last: s['top']['projects'][:last], after: s['top']['projects'][:after]
#  end
#  if s['top']['administration']['replace'].to_s.downcase == "true"
#    delete_menu_item :top_menu, :administration
#    menu :top_menu, :administration, {:controller => 'admin', :action => 'index'}, :caption => '', html: {:class=> s['top']['administration']['css'], :title=>I18n.t(:label_admin)}, first: s['top']['administration'][:first], last: s['top']['administration'][:last], after: s['top']['administration'][:after], if: Proc.new { User.current.admin? }
#  end
#  if s['top']['help']['replace'].to_s.downcase == "true"
#    delete_menu_item :top_menu, :help
#    menu :top_menu, :help, Redmine::Info.help_url, :caption => '', html: {:class=> s['top']['help']['css'], :title=>I18n.t(:label_help)}, first: s['top']['help'][:first], last: s['top']['help'][:last], after: s['top']['help'][:after]
#  end
end

require_relative 'after_init'
