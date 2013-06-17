require "legacy_mailers/version"

require 'action_mailer/adv_attr_accessor'
require 'action_mailer/old_api'
require 'action_mailer/deprecated_api'

ActionMailer::Base.class_eval do
  include ActionMailer::OldApi
  include ActionMailer::DeprecatedApi

  # class << self
  #   def respond_to?(method_symbol, include_private = false)
  #     matches_dynamic_method?(method_symbol) || super
  #   end

  #   def method_missing(method_symbol, *parameters)
  #     if match = matches_dynamic_method?(method_symbol)
  #       case match[1]
  #         when 'create'
  #           ActiveSupport::Deprecation.warn "#{self}.create_#{match[2]} is deprecated, " <<
  #             "use #{self}.#{match[2]} instead", caller[0,2]
  #           new(match[2], *parameters).message
  #         when 'deliver'
  #           ActiveSupport::Deprecation.warn "#{self}.deliver_#{match[2]} is deprecated, " <<
  #             "use #{self}.#{match[2]}.deliver instead", caller[0,2]
  #           new(match[2], *parameters).message.deliver
  #         else super
  #       end
  #     else
  #       super
  #     end
  #   end
  # end

  # def process(method_name, *args)
  #   initialize_defaults(method_name)
  #   super
  #   unless @mail_was_called
  #     create_parts
  #     create_mail
  #   end
  #   @_message
  # end

end
