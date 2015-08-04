module ResponseHelpers

  def response_body
    JSON.parse(response.body, symbolize_names: true)
  end

end

RSpec.configure do |c|
  c.include ResponseHelpers
end