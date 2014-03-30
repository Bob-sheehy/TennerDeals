class LunchController < ApplicationController
  skip_before_action :authorize

  def index
      @deals = Deal.where(:category => 'Lunch')

  end

  def show
  end
end
