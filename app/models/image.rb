require 'uri'

class Image < ApplicationRecord
  validate :validate_url

  def validate_url
    uri = URI.parse(url)
    raise URI::InvalidURIError unless uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    errors.add(:base, 'The URL you provided was invalid.')
  end
end
