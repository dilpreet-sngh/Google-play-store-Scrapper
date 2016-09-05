class AppsController < ApplicationController

  before_action :set_app, on: :show

  def show
  end

  def set_app
    @app = App.find_by(id: params[:id])
  end

end