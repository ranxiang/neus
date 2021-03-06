class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin_user!, only: [:update, :destroy]
  before_action :set_article, only: [:edit, :update, :destroy, :go]
  skip_before_action :authenticate_user!, only: [:go]

  def go
    @article.update_columns(pv: @article.pv + 1)
    redirect_to @article.source_url
  end

  # GET /articles
  # GET /articles.json
  def index
    #@articles = Article.all

    #FIXME this line is used for solve the case that user create failed then refresh page.
    redirect_to new_article_url
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to root_url, notice: t(:create_article_success) }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to root_url, notice: t(:update_article_success) }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      article_params = params.require(:article).permit(:title, :source_url, :summary)
      article_params[:user_id] = current_user.id
      article_params
    end
end
