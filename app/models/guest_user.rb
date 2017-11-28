class GuestUser < User
  attr_accessor :name, :first_name, :last_name, :email

  def current_user
    super || guest_user
  end

  
end