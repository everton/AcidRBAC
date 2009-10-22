require File.dirname(__FILE__) +  '/../test_helper'
require 'acid/active_record/extenssions.rb'
require 'user'

class ActiveRecordExtenssions < Test::Unit::TestCase
  def test_acts_as_user_definition
    assert(User.methods.include?('acts_as_user'),
           "Extenssions not adding #acts_as_user for ActiveRecord::Base")
    
    assert_nothing_raised do
      User.class_eval do
        acts_as_user
      end
    end
    
    user = User.new
    assert user.is_user?
    assert_equal user, user.owner
  end
end
