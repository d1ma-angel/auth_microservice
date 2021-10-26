module Uuid
  def before_validation
    super

    set_uuid
  end

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
