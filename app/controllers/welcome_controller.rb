class WelcomeController < ApplicationController
  include LoginHelper

  def index

  end

  def show_student
    @student = current_user
  end
end
