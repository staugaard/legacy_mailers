require "legacy_mailers/version"

require 'action_mailer/adv_attr_accessor'
require 'action_mailer/old_api'
require 'action_mailer/deprecated_api'

ActionMailer::Base.class_eval do
  include ActionMailer::OldApi
  include ActionMailer::DeprecatedApi
end
