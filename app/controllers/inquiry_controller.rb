class InquiryController < ApplicationController

	def index
    	@inquiry = Inquiry.new
    	render :layout => "inquiry"
  	end

  	def confirm
	    @inquiry = Inquiry.new(params[:inquiry])
	    if @inquiry.valid?
	      render :action => 'confirm'
	    else
	      render :action => 'index'
	    end
	end

	def thanks
    	@inquiry = Inquiry.new(params[:inquiry])
    	InquiryMailer.received_email(@inquiry).deliver
    	render :action => 'thanks'
 	 end
end
