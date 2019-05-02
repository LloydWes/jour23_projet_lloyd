class CommentsController < ApplicationController
  def show
    @related_gossip = Gossip.find_by(id: params['gossip_id'])
    @comment = Comment.find_by(id: params['id'])
  end
  def destroy
    Comment.where(id: params['id']).destroy_all
    redirect_to "/gossips/#{params['gossip_id']}"
  end
  def edit
    puts "-"*90
    @edit_gossip_comment = Comment.find(params['id'])
    puts @edit_gossip_comment
  end
  def index
  end
  def update
    # comment_to_edit = Comment.find(params['id'])
    # comment_params = params.require(:comment).permit(:content)
    # comment_to_edit = Comment.update(comment_params)
    comment_to_edit = Comment.find(params['id'])
    puts "!"*60, params['comment_content']
    content = params['comment_content']
    # comment_params = params.require(:comment).permit(:content)
    comment_to_edit = Comment.update(content: params['comment_content'])
  end
  def new
    # @gossip = Gossip.all.sample
    # @comment = Comment.new
    # Comment.create(gossip_id: 120, content: "okokok")
    # puts "%"*80
    # puts "New comment", @comment
    # puts "%"*60
    # puts @comment.class
  end
  def create
    puts "^"*60
    comment_params = params.require(:comment).permit(:content, :author, :gossip_id)
    # comment_params['gossip_id']
    puts comment_params
    if comment_params.permitted?
      g = Comment.new(comment_params)
      if g.valid?
        g.save
        puts "Comment saved" 
      else
        puts "Comment not valid"
      end
    else      puts "Erreur à la création du commentaire"
    end
    puts "^"*60
  end
end
