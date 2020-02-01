class MypagesController < ApplicationController

  def index
    render :layout => "mypage"
  end

  def show
  	@user = User.find(params[:id])
  	render :layout => "footers"
  end

end
