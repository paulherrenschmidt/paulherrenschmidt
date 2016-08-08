class FacebookUser

  attr_writer :name, :birthdate

  def initialize(email, password)

#def initialize en meme temps que .new

# STATE

    @email = email
    @password = password
    @name = ""
    @profile_pic = ""
    @friends = []
    @birthdate = nil
  end

#BEHAVIOUR (l'ensemble méthodes)

  def add_friend!(other_user)
    unless friends_with?(other_user)
      @friends << other_user
    other_user.add_friend!(self)
    end
  end

  def friends_with?(user)
    @friends.include?(user)
  end

  def age
    return (Date.today - @birthdate).to_i / 365
  end

  def change_password!(old_password, new_password)
    if old_password == @password
      @password = new_password
      return "Votre password a été mis a jour !"
    else
      return "T'es un boulet, un"
    end
  end
end
