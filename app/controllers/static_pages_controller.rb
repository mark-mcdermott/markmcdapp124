class StaticPagesController < ApplicationController

  skip_before_action :authorized, only: [:home, :about, :contact]

end
