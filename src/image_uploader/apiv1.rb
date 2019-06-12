# frozen_string_literal: true

require 'grape'

require_relative '../lib/storage'

module ImageUploader
  ## V1 of the API
  class APIv1 < Grape::API
    version :v1, using: :path, vendor: :dcamargo

    namespace :images do
      params do
        requires :image, type: File
        requires :path, type: String
      end
      post do
        path = File.join(
          params[:path],
          "#{Time.now.utc.strftime('%Y-%m-%d-%H-%M-%S-%Z')}-#{params[:image][:filename]}"
        )

        result = ::Storage.save(params[:image][:tempfile], path)

        { saved: result, path: path }
      end
    end
  end
end
