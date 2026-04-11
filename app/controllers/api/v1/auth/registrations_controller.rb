module Api
  module V1
    module Auth
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        def create
          build_resource(sign_up_params)

          if resource.save
            render json: {
              message: "Cadastro realizado com sucesso",
              user: {
                id: resource.id,
                name: resource.name,
                email: resource.email,
                role: resource.role
              }
            }, status: :created
          else
            render_unprocessable(resource.errors.full_messages)
          end
        end
      end
    end
  end
end
