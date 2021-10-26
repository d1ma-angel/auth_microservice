class UserSessionRoutes < Application
  namespace '/v1' do
    post '/login/?' do
      user_session_params = validate_with!(UserSessionParamsContract)

      result = UserSessions::CreateService.call(
        user_session_params[:email],
        user_session_params[:password]
      )

      if result.success?
        token = JwtEncoder.encode(uuid: result.session.uuid)
        meta = { token: token }

        status 201
        json({ meta: meta })
      else
        status 403
        error_response(result.session || result.errors)
      end
    end
  end
end
