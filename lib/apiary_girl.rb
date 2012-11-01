# -*- encoding : utf-8 -*-
require "factory_girl"

module ApiaryGirl
  mattr_accessor :definitions

  def self.create_definitions(parent_module = Dictionaries)
    # http://www.natontesting.com/2010/06/30/how-to-get-the-submodules-of-a-ruby-module/
    dictionary_modules = parent_module.constants.collect { |const_name| parent_module.const_get(const_name) }.select { |const| const.class == Module }

    dictionary_modules.each do |dictionary_module|
      add_dictionary_module(dictionary_module)
    end

    return definitions
  end

  def self.add_dictionary_module(dictionary_module)
    self.definitions ||= {}

    class_name = dictionary_module.to_s.demodulize

    symbol_key = class_name.underscore.to_sym

    self.definitions[symbol_key] = dictionary_module

    FactoryGirl.define do
      factory symbol_key do
      end
    end
  end

  def self.method_missing(method, *args, &block)
    if args.size >= 2 && FactoryGirl::Syntax::Methods.instance_methods(false).include?(method)
      factory_name = args.shift
      dictionary_method = args.shift
      if dictionary_module = definitions[factory_name]
        hash = dictionary_module.send(dictionary_method)
        if !args.empty? && overrides = args.shift and overrides.is_a?(Hash)
          hash = hash.merge(overrides)
        end
        FactoryGirl.send(method, factory_name, hash, &block)
      else
        raise "No definition found for #{factory_name.inspect}."
      end
    else
      super
    end
  end
end
