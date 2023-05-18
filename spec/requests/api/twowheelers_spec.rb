require 'swagger_helper'

RSpec.describe '/twowheelers', type: :request do
  path '/api/v1/twowheelers' do
    post 'Creates a bike' do
      tags 'Create new bike'
      consumes 'application/json'
      parameter name: :twowheeler, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          image_url: { type: :string },
          price: { type: :integer },
          model_year: { type: :integer },
          engine_type: { type: :string },
          fuel_type: { type: :string }
        },
        required: %w[name description image_url price]
      }

      response '201', 'bike created' do
        let(:twowheeler) do
          {
            name: 'foo',
            description: 'bar',
            image_url: 'https://www.pexels.com/photo/house-on-a-field-photographed-from-inside-of-a-car-10026861/',
            price: 3000,
            model_year: 2012,
            engine_type: 'inline',
            fuel_type: 'petrol'
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:twowheeler) do
          {
            name: 'foo',
            description: 'bar'
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/twowheelers/{id}' do
    get 'Retrieves bike details' do
      tags 'Get bike details'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

      response '200', 'Bike found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 image_url: { type: :string },
                 price: { type: :string },
                 model_year: { type: :integer },
                 engine_type: { type: :string },
                 fuel_type: { type: :string }
               },
               required: %w[name description image_url price]

        let(:id) do
          Twowheeler.create(
            name: 'foo',
            description: 'bar',
            image_url: 'https://www.pexels.com/photo/house-on-a-field-photographed-from-inside-of-a-car-10026861/',
            price: 3000,
            model_year: 2012,
            engine_type: 'inline',
            fuel_type: 'petrol'
          ).id
        end
        run_test!
      end

      response '404', 'bike not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
