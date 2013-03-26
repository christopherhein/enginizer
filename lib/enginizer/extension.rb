require "rvm"

module Enginizer
  class Extension < Thor::Group
    include Thor::Actions
    
    namespace "extension"
    argument :name, type: :string, desc: "name of the engine to create"
    desc "Bootstraps a new engine for development."
    class_options bundler: false, git: false, rvm: true, namespace: "nfinity"
    def configure_dependencies
      extension_path
      extension_name
    end
    
    # Build the extension
    def copy_extension
      directory "%namespaced_name%", extension_path
    end
    
    def rvm
      if options.rvm?
        ENV["rvm_trust_rvmrcs_flag"]="1"
        RVM.use_from_path! extension_path
      else
        run "rm #{extension_path}/.rvmrc"
      end
    end
    
    def bundler
      if options.bundler?
        run "cd #{extension_path} && bundle install" 
      end
    end
    
    def git
      if options.git?
        run "cd #{extension_path} && git init && git add ."
      end
    end
    
    # Scoping for the files
    def self.source_root
      File.expand_path("../templates", __FILE__)
    end
    
    def namespaced_name
      @namespaced_name
    end
    
    def namespace
      options.namespace
    end
      
    def extension_name
      @extension_name ||= @namespaced_name.gsub("#{options.namespace}_", "")
    end
      
    def author
      `git config user.name`.chomp
    end
      
    def email
      `git config user.email`.chomp
    end
    
    private
      
      def extension_path
        path = name.split("/")
        module_name = namespace_name(path.pop)
        path.push(module_name)
        @extension_path ||= path.join("/")
      end
      
      def namespace_name name
        return name if (name =~ /#{options.namespace}_/) == 0
        @namespaced_name ||= "#{options.namespace}_#{name}" 
      end
    
  end
end