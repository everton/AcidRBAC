require 'active_record'
require 'active_record/base'

module Acid
  module ActiveRecord
    module InstanceMethods
      def is_user?; false; end
      def owner; raise 'NotOwnered' unless self.class.ownered? ; end
    end
    
    module ClassMethods
      def self.extended(base)
        base.class_eval { include Acid::ActiveRecord::InstanceMethods } 
      end
      
      def ownered?; false; end
      def acts_as_user
        include Acid::ActiveRecord::User::InstanceMethods
      end
    end
    
    module User
      module InstanceMethods
        def is_user?; true; end
        def owner; self; end
      end
    end
  end
end

ActiveRecord::Base.extend(Acid::ActiveRecord::ClassMethods)


