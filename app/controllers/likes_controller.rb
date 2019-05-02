class LikesController < ApplicationController
  def update
    puts "*"*60
    if Like.where(id: params['id']).any?
      puts "existe"
      Like.where(id: params['id']).destroy_all
    else
      puts "existe pas"
      Like.create(gossip_id: params['gossip_id'], user_id: current_user.id).save
    end
    puts "end"
    redirect_to request.headers["HTTP_REFERER"] 
    # redirect_to '/'

    # redirect_to 'gossips#index'
  end
end
