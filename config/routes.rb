ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'home', :action => 'index'
  map.user ':login', :controller => 'users', :action => 'show'
  
end
