class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  def index
    @likes = Like.includes([:user, :book]).all
  end

  # GET /likes/1
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # POST /likes
  def create
    @like = Like.new(like_params)
    @book = Book.find_by(id: @like.book_id)
    @user_id = session[:usr]
    #render "books/show"

    respond_to do |format|
      if @like.save
        format.html { redirect_to @book, notice: 'LIKE was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:user_id, :book_id)
    end
end
