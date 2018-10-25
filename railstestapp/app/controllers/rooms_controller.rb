class RoomsController < ApplicationController
  def showchat
    @messages = Message.all
  end
end
