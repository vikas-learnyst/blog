class CommentsController < ApplicationController
    

    def index
        @article=Article.find(params[:article_id])
    
        render json: @article.comments.as_json(only:[:commenter,:body])
    end
    def show
       # @article=Article.find(params[:article_id])
        @comment=Comment.find(params[:id])
        
        render json: @comment.as_json(only:[:commenter,:body])
            
        


    end
    def create
        @article=Article.find(params[:article_id])
        @comment = Comment.create(
            commenter: params[:commenter],
            body: params[:body],
            article: @article
        )
        render json: @article.comments
    end 
    def update
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
        @comment.update(
            commenter: params[:commenter],
            body: params[:body],
            #article: @article
        )

        render json: @comment
    end 
    def destroy
        @comment=Comment.find(params[:id])
        @comment.destroy
    end
end
