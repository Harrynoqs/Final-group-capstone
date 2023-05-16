require 'swagger_helper'

describe 'Reservations API' do
  path '/api/v1/reservations' do
    post 'creates a reservation' do
      tags 'Create a reservation'
      consumes 'application/json', 'application/xml'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
         city: { type: :string },
         duration_of_test_drive: { type: :integer },
          date_of_reservation: { type: :string },
          user_id: { type: :integer },
          twowheeler_id: { type: :integer }

        },
        