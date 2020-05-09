class SendbookingsController < ApplicationController
    
    
    def create
        
        @truck = Truck.find(params[:truck_id])

        company = @truck.company
        model = @truck.model


       @partscost = Partscost.where(model: model, company_id: company.id).first
       @laborcost = Laborcost.where(model: model, company_id: company.id).first
       
       
       temp_mileage = @truck.last_mileage - @truck.initmileage
       count_cycle = (temp_mileage / 40000.0).round 
       temp2_mileage = (40000 * count_cycle) - 1

       pcost = @partscost.pickupcost(temp2_mileage)
       lcost = @laborcost.pickupcost(temp2_mileage)

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
#        binding.pry

        approvers.each do |member|
            ApproveMailer.deliver_email(member, filepathname).deliver_now
        end
        
        if (adminlogged_in?)
            ApproveMailer.deliver_email(admin_user, filepathname).deliver_now
        end

        lgt = Logithread.create(dealercompany_id: @truck.dealercompany_id, truck_id: @truck.id, seed: @name)
        if (adminlogged_in?)
            # 作成したLogithreadになりすましマークを付ける
            lgt.admin_id = admin_user.id
            lgt.save
        end

        redirect_to list_user_url(current_user)
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
