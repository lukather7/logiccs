class VehicleKartesController < ApplicationController

    def vehicle_karte
    end
    
    def karte
        @truck = Truck.find(params[:id])
        @loginote = @truck.loginotes.build
        @loginotes = @truck.loginotes
        company = @truck.company
        model = @truck.model
        
 
#        im = (@truck.initmileage != nil) ? @truck.initmileage : 0
 #       nextmileage = @truck.nextmileage
        
#        realnextmileage =  nextmileage - im;
        
        @partscost = Partscost.where(model: model, company_id: company.id)
        @laborcost = Laborcost.where(model: model, company_id: company.id)

       @partscostarray = []
       milesagestep = [40000, 80000, 120000, 160000, 200000, 240000]
#       @partscost

    end
    
    
    def booking
        @truck = Truck.find(params[:id])
        @loginote = @truck.loginotes.build
        @loginotes = @truck.loginotes
        company = @truck.company
        model = @truck.model


       @partscost = Partscost.where(model: model, company_id: company.id)
       @laborcost = Laborcost.where(model: model, company_id: company.id)

       @partscostarray = []
       milesagestep = [40000, 80000, 120000, 160000, 200000, 240000]

    end
    
    def show
    end
    
 #  layout 'history'
    
 #   def initialize
 #      super
 #       begin
 #           @history_data = JSON.parse(File.read("data.txt"))
 #       rescue
 #           @history_data = Hash.new
 #       end
 #       @history_data.each do |key,obj|
 #       end
 #       File.write("data.txt", @history_data.to_jason) 
 #   end
    
 #    def index
 #       if request.post? then
 #          obj = MyData.new(msg:params['msg'], name:params['name'], mail:params['mail'])
 #          @history_data[Time.now.to_i] = obj
 #          data = @history_data.to_json
 #          File.write("data.text", data)
 #          @history_data = JSON.parse(data)
 #       end
 #   end
    
 #   Class MyData
 #      attr_accessor :name
 #      attr_accessor :mail
 #      attr_accessor :msg
       
 #      def initialize msg:msg, name:name, mail:mail
 #          self.name = name
 #          self.mail = mail
 #          self.msg = msg
 #      end
 #   end
 
 
  def order
    @truck = Truck.find(params[:id])
   respond_to do |format|
      format.html { redirect_to karte_pdf_path(id: params[:id], format: :pdf, debug: 1)}
#      format.html { redirect_to karte_pdf_path(id: params[:id], format: :pdf)}

      format.pdf do
        render pdf: 'order',
               encoding: 'UTF-8',
               layout: 'pdf.html',
               orientation: 'Landscape',
               save_to_file: Rails.root.join('public','pdfs', "karte-#{@truck.id}" + ".pdf"),
               show_as_html: params[:debug].present?
      end
    end
  end
end   
