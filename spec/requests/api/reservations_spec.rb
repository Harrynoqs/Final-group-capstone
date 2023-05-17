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
        required: %w[city, duration_of_test_drive, date_of_reservation, user_id, twowheeler_id]
      }

      response '201', 'reservation created' do
        let(:reservation) do
          { city: 'Milan', date_of_reservation: '2023-05-17 00:00:00', duration_of_test_drive: 130, user_id: 1, twowheeler_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) do
          { city: 'Milan', duration_of_test_drive: 130, user_id: 1, twowheeler_id: 1 }
        end
        run_test!
      end
    end
  end
end
