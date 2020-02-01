class PubmenusController < InheritedResources::Base

  private

    def pubmenu_params
      params.require(:pubmenu).permit(:ashop_id, :user_id, :name, :img1, :img2, :img3)
    end

end
