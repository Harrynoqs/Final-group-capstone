require 'application_system_test_case'

class TwowheelersTest < ApplicationSystemTestCase
  setup do
    @twowheeler = twowheelers(:one)
  end

  test 'visiting the index' do
    visit twowheelers_url
    assert_selector 'h1', text: 'Twowheelers'
  end

  test 'should create twowheeler' do
    visit twowheelers_url
    click_on 'New twowheeler'

    fill_in 'Description', with: @twowheeler.description
    fill_in 'Engine type', with: @twowheeler.engine_type
    fill_in 'Fuel type', with: @twowheeler.fuel_type
    fill_in 'Image url', with: @twowheeler.image_url
    fill_in 'Model year', with: @twowheeler.model_year
    fill_in 'Name', with: @twowheeler.name
    fill_in 'Price', with: @twowheeler.price
    click_on 'Create Twowheeler'

    assert_text 'Twowheeler was successfully created'
    click_on 'Back'
  end

  test 'should update Twowheeler' do
    visit twowheeler_url(@twowheeler)
    click_on 'Edit this twowheeler', match: :first

    fill_in 'Description', with: @twowheeler.description
    fill_in 'Engine type', with: @twowheeler.engine_type
    fill_in 'Fuel type', with: @twowheeler.fuel_type
    fill_in 'Image url', with: @twowheeler.image_url
    fill_in 'Model year', with: @twowheeler.model_year
    fill_in 'Name', with: @twowheeler.name
    fill_in 'Price', with: @twowheeler.price
    click_on 'Update Twowheeler'

    assert_text 'Twowheeler was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Twowheeler' do
    visit twowheeler_url(@twowheeler)
    click_on 'Destroy this twowheeler', match: :first

    assert_text 'Twowheeler was successfully destroyed'
  end
end
