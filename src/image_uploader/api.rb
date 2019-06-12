# frozen_string_literal: true

require 'grape'
require 'dotenv/load'
require 'logger'

require_relative 'apiv1'

Dotenv.load('./config/.env')

module ImageUploader
  ##
  # Main API instatiation
  class API < Grape::API
    format :json
    prefix :api

    LOGGER = Logger.new(STDOUT).tap { |l| l.level = ENV['LOG_LEVEL'] || 'ERROR' }.freeze

    get '/status' do
      { status: :ok }
    end

    mount APIv1

    rescue_from Aws::Errors::ServiceError do |e|
      LOGGER.error(e.message)
      error!({ message: 'service is unavailable' }, 500)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error!(e, 400)
    end

    rescue_from :all
  end
end
