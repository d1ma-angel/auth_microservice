module Users
  class CreateService
    prepend BasicService

    param :name
    param :email
    param :password

    attr_reader :user

    def call
      @user = ::User.new(
        name: @name,
        email: @email,
        password: @password,
        password_confirmation: @password
      )

      if @user.valid?
        @user.save
      else
        fail!(@user.errors)
      end
    end
  end
end
