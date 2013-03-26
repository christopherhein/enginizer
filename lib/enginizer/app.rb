module Enginizer
  class App < Thor::Group
    include Thor::Actions
    
    namespace "new"
    argument :name, type: :string, desc: "name of the extension to create"
    desc "Bootstraps a new application."
    
  end
end