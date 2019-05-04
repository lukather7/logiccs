class LogithreadsController < ApplicationController
  def create
  end
  
  def index
    @thread = Logithread.find_by(seed: params[:id])
    @posts = @thread.logiposts.order("created_at ASC")
 
  end

  def destroy
    @logithread = Logithread.find(params[:id])
    @logithread.destroy if (@logithread)
    
    redirect_to dcurrent_user if dcurrent_user != nil
  end
  
  def access
    @thread = Logithread.find_by(seed: params[:apid])
    if (@thread == nil)
      redirect_to root_url
      return
    end
    redirect_to logiposts_path(@thread)
  end
  
  def confirm
    @logithread = Logithread.find(params[:id])
    @logithread.complete = Time.now
    @logithread.save
    
    contentstring = "<span class='notice_loginote'>Maintenance confirmed at "+
                     @logithread.complete.in_time_zone("Asia/Bangkok").strftime("%Y/%m/%d") +
                    " Scheduled at " + 
                    @logithread.logiposts.last.date.in_time_zone("Asia/Bangkok").strftime("%Y/%m/%d %H:%S") +
                    "</span>"
    newpost = @logithread.truck.loginotes.build(content: contentstring)
    newpost.save

    redirect_to :back
  end
    
  
  
end
