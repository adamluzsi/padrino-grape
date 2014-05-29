#encoding: UTF-8

module PadrinoGrape

  module Extend

    def root
      @_root ||= File.expand_path('..', __FILE__)
    end

    def dependencies
      @_dependencies ||= [].map { |file| ::Dir[ ::File.join(self.root, file)] }.flatten
    end

    def load_paths
      @_load_paths ||= %w().map { |path| ::File.join(self.root, path) }
    end

    def require_dependencies
      ::Padrino.set_load_paths(*load_paths)
      ::Padrino.require_dependencies(dependencies, :force => true)
    end

    def setup_application!
      return if @_configured
      self.require_dependencies
      @_configured = true
      return @_configured
    end

    def reload!
    end

    def app_file
      ""
    end

    def app_name
      self.to_s
    end

    def public_folder
      ""
    end

  end

  def self.extended base
    base.__send__ :extend, ::PadrinoGrape::Extend
    base.__send__ :setup_application!
  end

  def self.included base
    base.__send__ :extend, ::PadrinoGrape::Extend
    base.__send__ :setup_application!
  end

end
