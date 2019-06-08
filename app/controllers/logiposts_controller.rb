class LogipostsController < ApplicationController
  def index

    @thread = Logithread.find_by(id: params[:id])
    @posts = @thread.logiposts.order("created_at ASC")
    @post = @thread.logiposts.build    
    
  end
  
  
  def create
    @thread = Logithread.find_by(id: params[:id])
    
    post = @thread.logiposts.build(post_params)
    
  
    if (dealer_logged_in?)
#      binding.pry
      post.dealeruser_id = dcurrent_user.id
    end
    if (post.save)
      
      flash[:success] = "Post succeed"
       if (post.dealeruser_id != nil) 
          send_mail2user(@thread, post)
       end
      redirect_to logiposts_path(@thread)
    else
      flash[:error] = "Post succeed"
      render :index
    end
    
  end
  
  def send_mail2user(thread, post)

    @truck = thread.truck
    
    if (thread.admin_id == nil)
      approvers = Approver.where(company_id: @truck.company_id)
  
      approvers.each do |member|
          NoticeMailer.deliver_email(member, thread, post).deliver_now
      end
    else
      # logithread is faked by admin
      admin = Admin.find_by(id: thread.admin_id)
      NoticeMailer.deliver_email(admin, thread, post).deliver_now
    end
    
  end
  
  
  def destroy
    post = Logipost.find(params[:id])
    
    if (dcurrent_user != nil) && (post.dealeruser == dcurrent_user)
        post.destroy if post != nil
    elsif (dcurrent_user == nil) && (post.user == nil)
        post.destroy if post != nil
    end
      
    redirect_to :back 
    # redirect_back(fallback_location: root_url)
  end
  

  private
  
  def post_params
  
    params.require(:logipost).permit(:date, :content) 
    
  end
  
  
end
