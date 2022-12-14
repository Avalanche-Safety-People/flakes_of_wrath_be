class Forecast
  attr_reader :max_temp, :min_temp, :description, :avg_wind_speed, :max_wind_speed, :attributes, :id

  def initialize(attributes)
    @max_temp = attributes[:temp][:max]
    @min_temp = attributes[:temp][:min]
    @description = attributes[:weather].first[:description]
    @avg_wind_speed = attributes[:wind_speed]
    @max_wind_speed = attributes[:wind_gust]
    @attributes = attributes # #optional stand in for any additional needed info
  end

  def snowfall
    @attributes[:snow] || 0
  end

  def rainfall
    @attributes[:rain] || 0
  end
end