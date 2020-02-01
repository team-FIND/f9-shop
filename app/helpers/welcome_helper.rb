module WelcomeHelper

   def page_title
    title = "F9"
    title = @page_title + " - " + title if @page_title
    title
   end

end
