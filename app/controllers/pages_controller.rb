class PagesController < ApplicationController
  def home
  end
  def team
  end
  def contact
  end
  def hidden_link
  end
  def gossip_display
    @gossip = Gossip.find(params['id'])
  end
  def user_profil
    @user = User.find(params['id'])
  end
end
