module Auth
  class FetchUserService
    prepend BasicService

    param :uuid

    attr_reader :user

    def call
      if @uuid !~ /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/ || session.blank?
        return fail!(I18n.t(:forbidden, scope: 'services.auth.fetch_user_service'))
      end

      @user = session.user
    end

    private

    def session
      @session ||= UserSession.first(uuid: @uuid)
    end
  end
end
