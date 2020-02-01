class PubimgsController < InheritedResources::Base

  private

    def pubimg_params
      params.require(:pubimg).permit(:user_id, :ashop_id, :topimg, :foodname1, :foodname2, :price, :foodimg1, :foodimg2, :foodimg3)
    end

end
