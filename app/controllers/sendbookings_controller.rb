class SendbookingsController < ApplicationController
    
    
    def create
        
        @truck = Truck.find(params[:truck_id])

        company = @truck.company
        model = @truck.model


       @partscost = Partscost.where(model: model, company_id: company.id).first
       @laborcost = Laborcost.where(model: model, company_id: company.id).first

       pcost = @partscost.pickupcost(@truck.last_mileage - @truck.initmileage)
       lcost = @laborcost.pickupcost(@truck.last_mileage - @truck.initmileage)

 #      @partscostarray = []
 #     milesagestep = [40000, 80000, 120000, 160000, 200000, 240000]        
       @name = Dir::Tmpname.make_tmpname("", "")
       # @nameが承認のランダム番号
       
       
       @sendbook = Sendbooking.new
       lcost.id = nil
       pcost.id = nil
       atr_lcost = lcost.attributes
       atr_pcost = pcost.attributes
       atr_lcost.delete("type")
       atr_pcost.delete("type")

       @sendbook = Sendbooking.new
       @sendbook.build_bookinglaborcost(atr_lcost)
       @sendbook.build_bookingpartscost(atr_pcost)
       @sendbook.name = @name
       @sendbook.save
       @approve_url = "https://" + ENV['MY_HOSTNAME'] + approve_path + "?apid=" + @name

 
       pdf = render_to_string pdf: "sendbooking_#{@truck.id}",
                           layout: 'pdf.html', 
                           template: 'sendbookings/order.pdf.erb'


#        binding.pry
        
        filepathname = "/tmp/" + @name + ".pdf"
        File.open(filepathname, "w") {|t|
            t.binmode
            t.write pdf
        }
        
        # filepathname = "/tmp/t20181014-1945-1d9rmo9.pdf"
        #randomseed = 
        

        approvers = Approver.where(company_id: @truck.company_id)
        binding.pry

        approvers.each do |member|
            ApproveMailer.deliver_email(member, filepathname).deliver_now
        end

        redirect_to :back 
    end
    
    
    
    def approve
        @sendbook = Sendbooking.find_by(name: params[:apid])
#        @sendbook.update({done:true});
    end
    
    def approveOK
        @sendbook = Sendbooking.find(params[:sendbooking][:id])
        @sendbook.update({done:true});
    end

    def approveCancel
        @sendbook = Sendbooking.find(params[:sendbooking][:id])       
        
    end

end
