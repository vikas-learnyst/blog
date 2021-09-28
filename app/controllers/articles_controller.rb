class ArticlesController < ApplicationController
  
  def index
    render json: @current_user.articles
  end
  def show
    @article=@current_user.articles.find(params[:id])
    render json: {article: @article.as_json(only:[:title,:body]),articlecomments: @article.comments.as_json(only:[:commenter,:body])}
    
    
  end
  
  def create
    #@user=User.find(params[:user_id])

    @article = Article.create(
        title: params[:title],
        body: params[:body],
        user: @current_user
        
    )
    render json: @current_user.articles
end 

def update
    #@user=User.find(params[:user_id])
    @article = Article.find(params[:id])
    @article.update(
        title: params[:title],
        body: params[:body]
    )
    render json: @article
end 


  
  def destroy
    @articles=Article.all
    @article = Article.find(params[:id])
    @article.destroy
     render json:@articles
    
  end


end