require_dependency 'fontawesome_hook_listener'

Redmine::Plugin.register :fontawesome do
  name 'Font Awesome plugin'
  author '!Lucky'
  description 'Add support for font awesome classes'
  version '0.0.2'
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
end

require_relative 'after_init'
