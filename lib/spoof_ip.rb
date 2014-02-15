class SpoofIp

  attr_reader :ip

  def initialize(app, ip)
    @app = app
    @ip = ip
  end

  def call
    ENV['HTTP_X_FORWARDED_FOR'] = nil
    ENV['REMOTE_ADDR'] = ENV['action_dispatch.remote_ip'] = @ip
    # Geocoder.search(@ip)
    binding.pry
    @status, @headers, @response = @app.call(ENV)
    [@status, @headers, @response]
  end
end