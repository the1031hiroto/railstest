class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:index, :show, :edit, :update, :destroy]

  # GET /books
  def index
    @books = Book.includes(:user).all
    @user_id = session[:usr]
  end

  # GET /books/1
  def show
    @like = Like.find_by(book_id: params[:id], user_id: @user_id)
    if @like
      @like_exist = true
    else
      @like_exist = false
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    @book.created_at= Time.now

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
      @user_id = session[:usr]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def check_logined
      if session[:usr] then 

        begin
          @usr = User.find(session[:usr])

        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end 

      unless @usr 
        flash[:referer] = request.fullpath
        redirect_to controller: :login, action: :index
      end
    end
end
