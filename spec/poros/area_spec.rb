require 'rails_helper'

RSpec.describe Area do
 before :each do

  ## TO DO -- Replace AreaFacade Method with poro data hash (pry into method to get necessary data)
  # @data = {
  #  id: 7,
  #  name: "West Slopes North",
  #  state: "WA",
  #  url: "http://www.nwac.us/avalanche-forecast/#/west-slopes-north",
  #  zone_id: "4"
  # }
  # @area = Area.new(@data)
    @area = AreaFacade.single_area(1128)
 end

 it 'is an instance of Area', :vcr do
  expect(@area).to be_an_instance_of(Area)
 end

 it 'has attributes', :vcr do
  expect(@area.name).to eq("Olympics")
  expect(@area.name).to be_a String
  expect(@area.state).to eq("WA")
  expect(@area.state).to be_a String
  expect(@area.url).to eq("http://www.nwac.us/avalanche-forecast/#/olympics")
  expect(@area.url).to be_a String
  expect(@area.id).to eq(1128)
  expect(@area.id).to be_a Integer
 end

 it 'can return an 8 day avalanche danger forecast', :vcr do
    areas = AreaFacade.area_details
    area = areas.first

    expect(area.av_danger).to be_a Array
    expect(area.av_danger.count).to eq 8
  end

  it 'can return a single area information and av_risk', :vcr do
    area = AreaFacade.single_area(1128)
    expect(area.current_av_risk).to be_a Integer
    expect(area.av_danger).to be_a Array
  end
end
