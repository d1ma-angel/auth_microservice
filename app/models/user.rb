class User < Sequel::Model
  plugin :secure_password

  NAME_FORMAT = /\A\w+\z/.freeze

  one_to_many :sessions, class: :UserSession, key: :user_id

  def validate
    super

    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
    validates_presence :password, message: I18n.t(:blank, scope: 'model.errors.user.password')
    validates_format NAME_FORMAT, :name, message: I18n.t(:invalid, scope: 'model.errors.user.name')
  end
end
