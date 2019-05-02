class GossipsController < ApplicationController
before_action :authenticate_user, only: [:new]
# before_action :belongs_to_use, only: [:edit, :update]

  def new
    @gossip = Gossip.new
    puts "%"*20
    puts "New gossip"
  end
  def create
    # puts "$"*60
    # puts "Gossip create"
    user = User.all.sample.id
    # puts user
    goss_params = params.require(:gossip).permit(:title, :content)
    goss_params['user_id'] = user
    # puts goss_params
    # @goss = Gossip.create(goss_params)
    # @gossip = Gossip.create(title: params['gossip_title'],content: params['gossip_content'], user_id: User.all.sample.id)
    if goss_params.permitted?
      # puts "Gossip is permitted"
      @goss = Gossip.new(goss_params)
      if @goss.valid?
        # puts "Gossip is valid"
        flash['errors'] = Array.new
        if @goss.save
          # puts "Gossip saved"
        else
          # puts "Gossip not saved"
        end
      else
        flash['errors'] = @goss.errors.details
      end
    else
      flash['errors'] = [{'erroe' => "gossip not permitted"}]
      # puts flash.inspect
      # render 'create'
    end
    # puts "$"*60
    # render 'create'
  end
  def show
    @gossip = Gossip.find(params['id'])
    @comments_array = Comment.where(gossip_id: params['id'])
    @comment = Comment.new
  end
  def index
  end
  def destroy
    # puts "-"*100
    # puts "destroy", params['id']
    # puts "-"*100
    Gossip.where(id: params['id']).destroy_all
  end
  def edit
    @edit_gossip = Gossip.find(params['id'])
  end
  def update
    gossip_to_edit = Gossip.find(params['id'])
    gossip_params = params.require(:gossip).permit(:title, :content)
    gossip_to_edit.update(gossip_params)
  end

  private
  def authenticate_user
    if session['user_id']
      return true
    else
      flash[:danger] = "Vous devez être connecté pour effectuer cette action"
    end
  end

  # def belongs_to_use
  #   if session
  # end
end
