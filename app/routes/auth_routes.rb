class AuthRoutes < Application
  helpers Auth

  namespace '/v1' do
    post '/auth/?' do
      result = Auth::FetchUserService.call(extracted_token['uuid'])

      if result.success?
        json(meta: { user_id: result.user.id })
      else
        status 403
        error_response result.errors
      end
    end
  end
end
