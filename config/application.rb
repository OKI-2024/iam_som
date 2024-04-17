require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IamSom
  class Application < Rails::Application
     # 最初に生成されたRailsバージョンのデフォルト設定を初期化します。
     config.load_defaults 7.0
     config.active_storage.variant_processor = :mini_magick  
 
     # アプリケーション、エンジン、およびrailtiesの設定はここに記述します。
     #
     # これらの設定は、特定の環境のconfig/environments内のファイルを使用して、
     # 後で上書きすることができます。
     #
     # config.time_zone = "Tokyo"
     # config.i18n.default_locale = :ja
 
     # 日本語をデフォルトの言語として設定
     config.i18n.default_locale = :ja
 
     # ロケールファイルのパスを指定
     config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
