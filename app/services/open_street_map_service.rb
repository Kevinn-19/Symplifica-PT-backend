require "net/http"
require "uri"
require "json"

class OpenStreetMapService

  BASE_URL = "https://nominatim.openstreetmap.org/search"

  def self.search(city)
    uri = URI(BASE_URL)

    uri.query = URI.encode_www_form(
      q: city,
      format: "json",
      limit: 1
    )

    request = Net::HTTP::Get.new(uri)
    request["User-Agent"] = "SymplificaPruebaTecnica"

    response = Net::HTTP.start(
      uri.hostname,
      uri.port,
      use_ssl: true
    ) do |http|
      http.request(request)
    end

    result = JSON.parse(response.body).first

    return nil unless result

    {
      latitude: result["lat"],
      longitude: result["lon"],
      display_name: result["display_name"]
    }
  end

end