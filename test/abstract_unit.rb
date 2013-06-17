require 'active_support/core_ext/kernel/reporting'

require 'active_support/core_ext/string/encoding'
if "ruby".encoding_aware?
  # These are the normal settings that will be set up by Railties
  # TODO: Have these tests support other combinations of these values
  silence_warnings do
    Encoding.default_internal = "UTF-8"
    Encoding.default_external = "UTF-8"
  end
end

silence_warnings do
  # These external dependencies have warnings :/
  require 'mail'
end

lib = File.expand_path("#{File.dirname(__FILE__)}/../lib")
$:.unshift(lib) unless $:.include?('lib') || $:.include?(lib)

require 'test/unit'
require 'action_mailer'
require 'action_mailer/test_case'
require 'mocha'
require 'debugger'

require 'legacy_mailers'

# Show backtraces for deprecated behavior for quicker cleanup.
ActiveSupport::Deprecation.debug = false

# Bogus template processors
ActionView::Template.register_template_handler :haml, lambda { |template| "Look its HAML!".inspect }
ActionView::Template.register_template_handler :bak, lambda { |template| "Lame backup".inspect }

FIXTURE_LOAD_PATH = File.expand_path('fixtures', File.dirname(__FILE__))
ActionMailer::Base.view_paths = FIXTURE_LOAD_PATH

class MockSMTP
  def self.deliveries
    @@deliveries
  end

  def initialize
    @@deliveries = []
  end

  def sendmail(mail, from, to)
    @@deliveries << [mail, from, to]
  end

  def start(*args)
    yield self
  end
end

class Net::SMTP
  def self.new(*args)
    MockSMTP.new
  end
end

def set_delivery_method(method)
  @old_delivery_method = ActionMailer::Base.delivery_method
  ActionMailer::Base.delivery_method = method
end

def restore_delivery_method
  ActionMailer::Base.delivery_method = @old_delivery_method
end
