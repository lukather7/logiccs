class DealercompaniesController < ApplicationController
    
    def index
        @companies = Dealercompany.all.order("created_at DESC").page(params[:page]);
    end
    
    def new
        @dealercompany = Dealercompany.new  
    end
    
    def create
        @dealercompany = Dealercompany.new(dealercompany_params)
        if @dealercompany.save
         flash[:success] = "Welcome to LOGICCS !"    
         redirect_to admin_path
        else
         render 'new'
        end 
    end
    
    def index
        @dealercompanies = Dealercompany.all.order("created_at ASC")
    end
    
    def edit
        @dealercompany = Dealercompany.find(params[:id])
    end
    
    
    def update
        @dealercompany = Dealercompany.find(params[:id])
        
        if (@dealercompany.save)
            flash[:success] = "Update Succeeded"
            redirect_to admin_path
        else
            flash[:error] = "Update failed"
            render :edit
        end
        
    end
    
    def destroy
        @dealercompany = Dealercompany.find(params[:id])
        @dealercompany.destroy if (@dealercompany)
        redirect_to companies_url
    end
    
    private
      def dealercompany_params
        params.require(:dealercompany).permit(:name)
      end   
end
