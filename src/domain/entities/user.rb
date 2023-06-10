class User
  attr_accessor :name, :email, :password

  def initialize(params)
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
  end
end