require 'swagger_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  path '/api/v1/login' do
    post 'Login a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :name, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, description: 'User name' }
        },
        required: ['name']
      }

      response '200', 'Login success' do
        let(:name) { 'John Doe' }
        run_test!
      end

      response '403', 'Login failure, User does not exist' do
        let(:name) { 'NonExistingUser' }
        run_test!
      end
    end
  end

  path '/api/v1/register' do
    post 'Register a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :name, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, description: 'User name' }
        },
        required: ['name']
      }

      response '201', 'User is registered successfully' do
        let(:name) { 'John Doe' }
        run_test!
      end

      response '200', 'User already exists' do
        let(:name) { 'ExistingUser' }
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    get 'Get user reservations' do
      tags 'Users'
      parameter name: :id, in: :path, type: :integer, description: 'User ID'

      response '200', 'Reservation successfully found' do
        let(:id) { User.first.id }
        run_test!
      end

      response '404', 'User could not be found' do
        let(:id) { 9999 }
        run_test!
      end
    end
  end
end
