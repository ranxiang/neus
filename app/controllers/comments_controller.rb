class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :authenticate_current_user_for_destroy_comment!, only: [:update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        #format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.html { redirect_to article_comments_url(article_id: @comment.article), notice: t(:create_comment_success) }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :index}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_comments_url(article_id: @comment.article), notice: t(:destroy_comment_success) }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      comment_params = params.require(:comment).permit(:article_id, :body)
      comment_params[:user_id] = current_user.id
      comment_params
    end

    def authenticate_current_user_for_destroy_comment!
      return true if current_user && current_user.admin?
      redirect_to article_comments_url(article_id: @comment.article), notice: t(:no_permission_hint) if current_user != @comment.user
	end
end
