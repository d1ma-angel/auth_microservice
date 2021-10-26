class User < Sequel::Model
  NAME_FORMAT = %r{\A\w+\z}

  one_to_many :sessions, class: :UserSession, key: :user_id

  def validate
    super

    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
    validates_presence :password, message: I18n.t(:blank, scope: 'model.errors.user.password')
    validates_format NAME_FORMAT, :name, message: I18n.t(:invalid, scope: 'model.errors.user.name')
  end

  def password
    @password ||= BCrypt::Password.new(password_digest) if password_digest
  end

  def password=(new_password)
    return if new_password.blank?

    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

  def authenticate(unencrypted)
    password == unencrypted
  end
end