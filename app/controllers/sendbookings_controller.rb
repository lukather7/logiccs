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
       name = Dir::Tmpname.make_tmpname("", "")
       
       @sendbook = Sendbooking.new
       binding.pry
       lcost.id = nil
       pcost.id = nil
       atr_lcost = lcost.attributes
       atr_pcost = pcost.attributes
       atr_lcost.delete("type")
       atr_pcost.delete("type")

       @sendbook = Sendbooking.new
       @sendbook.build_bookinglaborcost(atr_lcost)
       @sendbook.build_bookingpartscost(atr_pcost)

       
       pdf = render_to_string pdf: "sendbooking_#{@truck.id}",
                           layout: 'vehicle_kartes/pdf.html', 
                           template: 'vehicle_kartes/order.pdf.erb'



        approvers = Approver.where(company_id: @truck.company_id)

        approvers.each do |member|
          # send_appvorver_mail(member, pdf) 
        end

    end
end
