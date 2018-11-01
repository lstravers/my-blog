class ArticlesController < ApplicationController
  
  #A frequent practice is to place the standard CRUD actions in each controller in the following order: index, show, new, edit, create, update and destroy. You may use any order you choose but these are public methods, they must be placed before declaring private visibility in the controller.

def show
  @article = Article.find(params[:id])
  # @article is an instance variable that holds a reference to the article object. We do this because Rails will pass all instance variables to the view.
end

def new
end

def create
  @article = Article.new(article_params)
    #The capital "A" about referrs to the class named Article that is defined in app/models/article.rb. Class names in Ruby must begin with a capital letter.

  @article.save 
  #returns a boolean indicating whether the article was saved or not
  redirect_to @article
end

#strong parameters: whitelist  controller parameters to prevent wrongful mass assignment. In this case, we want to both allow and require the title and text parameters for valid use of create

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
