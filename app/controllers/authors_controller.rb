class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.find(params[:id])
    if @author.valid?
      redirect_to author_path
    else
      flash[:error] = @author.erros.full_messages
      redirect_to new_author_path(@author)
    end
  end

  private

  def author_params
    params.require(:author).requre(:name, :phone_number)
  end
end
