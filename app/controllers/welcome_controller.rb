class WelcomeController < ApplicationController

  def index
    $ashops = Ashop.all
    $bshops = Bshop.all
    $cshops = Cshop.all
    $dshops = Dshop.all
    $eshops = Eshop.all
    $fshops = Fshop.all
    $gshops = Gshop.all
    $hshops = Hshop.all
  end

  def video
    render :layout => "footers"
  end

  def allf9
    render :layout => "footers"
  end

  def usage
    render :layout => "footers"
  end

  def sitemap
    render :layout => "footers"
  end

  def mail
    render :layout => "footers"
  end

  def aboutus
    render :layout => "footers"
  end

  def code
    render :layout => "footers"
  end

  def respon
    render :layout => "footers"
  end

  def pp
    render :layout => "footers"
  end

end
