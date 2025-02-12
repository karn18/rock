require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rock
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Asia/Bangkok"
    # config.eager_load_paths << Rails.root.join("extras")
    config.exceptions_app = self.routes
    config.action_dispatch.show_exceptions = true

    # config.exceptions_app = (->(env) {
    #   request = ActionDispatch::Request.new(env)
    #   status = request.path_info[1..-1].to_i

    #   puts status
    #   puts "check status #{status}"
    #   ApplicationController.action(:render_error).call(env)
    # })
  end
end
