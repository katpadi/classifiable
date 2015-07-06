require "classifiable/version"
require 'active_record'
require 'active_support/all'
require "classifiable/classification"

module Classifiable
  def self.included(base)
    base.extend ClassMethods  
  end

  module ClassMethods
    def classifiable(options={})
      has_many :classifiables_classifications,
               as: :classifiable

      has_many :classifications,
               through: :classifiables_classifications
      include Classifiable::InstanceMethods
      extend Classifiable::SingletonMethods
    end

    def classifiable?
      true
    end

    attr_accessor :classifications
    def classifications=(classification_tokens)
      classification_tokens.reject! { |c| c.blank? }
      self.classification_ids = classification_tokens
    end
  end

  module InstanceMethods
    def instance_method?
      true
    end
  end

  module SingletonMethods
  end

end

ActiveRecord::Base.send(:include, Classifiable)