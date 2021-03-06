class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "irol",
  password: "program", except: [:index, :show]
  
  #A frequent practice is to place the standard CRUD actions in each controller in the following order: index, show, new, edit, create, update and destroy. You may use any order you choose but these are public methods, they must be placed before declaring private visibility in the controller.

def index
  @articles = Article.all
end

def show
  @article = Article.find(params[:id])
  # @article is an instance variable that holds a reference to the article object. We do this because Rails will pass all instance variables to the view.
end

def new
  @article = Article.new
end

def edit
  @article = Article.find(params[:id])
end

def create
  @article = Article.new(article_params)
    #The capital "A" about referrs to the class named Article that is defined in app/models/article.rb. Class names in Ruby must begin with a capital letter.

  if @article.save 
  #returns a boolean indicating whether the article was saved or not
  redirect_to @article
  else
    render 'new'
  end
end

#use render instead of redirect_to when save returns false. The render method is used so that the @article object is passed back to the new template when it is rendered. This rendering is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request.

#strong parameters: whitelist  controller parameters to prevent wrongful mass assignment. In this case, we want to both allow and require the title and text parameters for valid use of create

def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
