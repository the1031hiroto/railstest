class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @messages = Message.includes(:user).where(room_id: params[:id])
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @room.messages.build
    @users = User.select(:username).distinct
    #@message = Message.create(content: 'message', user_id: 1, room_id: 1)
    
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    #@room.name = 'test'
    #@room.room_user.create({ room_id: @room.id, user_id: 1 })
    pp room_params

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        #@room.messages.create({ room_id: @room.id, user_id: message_params, content: "user id #{1} is added" })
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.includes(:messages, :users).where(id: params[:id])
      #@user = User.find_by(id: session[:usr])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, messages_attributes: [:user_id])
    end

    #def message_params
    #  params.require(:message).permit(:ids)
    #end
end
