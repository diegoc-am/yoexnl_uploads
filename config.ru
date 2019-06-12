# frozen_string_literal: true

require 'rack'
require 'rack/contrib'
require_relative 'src/image_uploader/api.rb'

use Rack::TryStatic,
    root: File.expand_path('public', __dir__),
    urls: %w[/], try: ['.html', 'index.html', '/index.html']

run ImageUploader::API
