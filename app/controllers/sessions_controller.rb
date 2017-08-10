class SessionsController < ApplicationController
  def new
    @session = Session.new
    render :new
  end
end
