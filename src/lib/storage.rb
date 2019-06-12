# frozen_string_literal: true

require 'aws-sdk-s3'

##
# Storage interface
class Storage
  class << self
    def save(file, path)
      client.put_object(body: file, key: path, bucket: bucket)

      true
    end

    private

    def client
      @client ||= ::Aws::S3::Client.new
    end

    def bucket
      ENV['AWS_BUCKET']
    end
  end
end
