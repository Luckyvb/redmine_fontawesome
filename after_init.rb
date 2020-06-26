require 'uri'
require 'redmine'

def fontawesome_init

  Redmine::MenuManager.map :top_menu do |menu|
    d = Redmine::Plugin::registered_plugins[:fontawesome].settings[:default] ||= {}
    s = d.deep_merge(Setting["plugin_fontawesome"] ||= {})['menu']
    I18n.load_path += Dir[Rails.root.join("config","locales","*.yml")]
    I18n.load_path += Dir[Rails.root.join("plugins","fontawesome","config","locales","*.yml")]
    I18n.locale = !User.current.language.blank? ? User.current.language : Setting.default_language

    if menu.exists?(:home) && s['top']['home']['replace'].to_s.downcase == "true"
      menu.delete :home
      menu.push :home, :home_path, :caption => '', html: {:class=> s['top']['home']['css'], :title=>I18n.t('label_home')}, first: s['top']['home']['first'], last: s['top']['home']['last'], after: s['top']['home']['after']
    end
    if menu.exists?(:my_page) && s['top']['my']['replace'].to_s.downcase == "true"
      menu.delete :my_page
      menu.push :my_page, {:controller => 'my', :action => 'page'}, :caption => '', html: {:class=> s['top']['my']['css'], :title=>I18n.t(:label_my_page)}, first: s['top']['my'][:first], last: s['top']['my'][:last], after: s['top']['my'][:after], if: Proc.new { User.current.logged? }
    end
    if menu.exists?(:projects) && s['top']['projects']['replace'].to_s.downcase == "true"
      menu.delete :projects
      menu.push :projects, {:controller => 'projects', :action => 'index'}, :caption => '', html: {:class=> s['top']['projects']['css'], :title=>I18n.t(:label_project_plural)}, first: s['top']['projects'][:first], last: s['top']['projects'][:last], after: s['top']['projects'][:after]
    end
    if menu.exists?(:administration) && s['top']['administration']['replace'].to_s.downcase == "true"
      menu.delete :administration
      menu.push :administration, {:controller => 'admin', :action => 'index'}, :caption => '', html: {:class=> s['top']['administration']['css'], :title=>I18n.t(:label_administration)}, first: s['top']['administration'][:first], last: s['top']['administration'][:last], after: s['top']['administration'][:after], if: Proc.new { User.current.admin? }
    end
    if menu.exists?(:help) && s['top']['help']['replace'].to_s.downcase == "true"
      menu.delete :help
      menu.push :help, Redmine::Info.help_url, :caption => '', html: {:class=> s['top']['help']['css'], :title=>I18n.t(:label_help)}, first: s['top']['help'][:first], last: s['top']['help'][:last], after: s['top']['help'][:after]
    end
  end

  Redmine::MenuManager.map :account_menu do |menu|
    d = Redmine::Plugin::registered_plugins[:fontawesome].settings[:default] ||= {}
    s = d.deep_merge(Setting["plugin_fontawesome"] ||= {})['menu']
    I18n.load_path += Dir[Rails.root.join("config","locales","*.yml")]
    I18n.load_path += Dir[Rails.root.join("plugins","fontawesome","config","locales","*.yml")]
    I18n.locale = !User.current.language.blank? ? User.current.language : Setting.default_language

    if menu.exists?(:login) && s['account']['login']['replace'].to_s.downcase == "true"
      menu.delete :login
      menu.push :login, :signin_path, :caption => '', html: {:class=> s['account']['login']['css'], :title=>I18n.t(:label_login)}, first: s['account']['login'][:first], last: s['account']['login'][:last], after: s['account']['login'][:after], if: Proc.new { !User.current.logged? }
    end
    if menu.exists?(:register) && s['account']['register']['replace'].to_s.downcase == "true"
      menu.delete :register
      menu.push :register, :register_path, :caption => '', html: {:class=> s['account']['register']['css'], :title=>I18n.t(:label_my_page)}, first: s['account']['register'][:first], last: s['account']['register'][:last], after: s['account']['register'][:after], if: Proc.new { !User.current.logged? && !Setting.self_registration? }
    end
    if menu.exists?(:my_account) && s['account']['my_account']['replace'].to_s.downcase == "true"
      menu.delete :my_account
      menu.push :my_account, {:controller => 'my', :action => 'account'}, :caption => '', html: {:class=> s['account']['my_account']['css'], :title=>I18n.t(:label_my_page)}, first: s['account']['my_account'][:first], last: s['account']['my_account'][:last], after: s['account']['my_account'][:after], if: Proc.new { User.current.logged? }
    end
    if menu.exists?(:logout) && s['account']['logout']['replace'].to_s.downcase == "true"
      menu.delete :logout
      menu.push :logout, :signout_path, :caption => '', html: {:class=> s['account']['logout']['css'], :title=>I18n.t(:label_my_page)}, first: s['account']['logout'][:first], last: s['account']['logout'][:last], after: s['account']['logout'][:after], if: Proc.new { User.current.logged? }
    end
  end

  #Redmine::MenuManager.map :admin_menu do |menu|
  #end

  #Redmine::MenuManager.map :project_menu do |menu|
  #end
end

fontawesome_init