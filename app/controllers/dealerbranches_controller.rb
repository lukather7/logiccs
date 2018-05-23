class DealerbranchesController < ApplicationController
    
    def index
        @companies = Dealercompany.all
        @branches = Dealerbranch.all.order("created_at DESC").page(params[:page]);
    end
    
    def new
        @dealerbranch = Dealerbranch.new  
    end
    
    def create
        @Dealerbranch = Dealerbranch.new(dealerbranch_params)
        if @Dealerbranch.save
         flash[:success] = "Branch added !"    
         redirect_to admin_path
        else
         render 'new'
        end 
    end
    
    def index
        @dealerbranches = Dealerbranch.includes(:dealercompany).all.order("dealercompany_id ASC, name ASC")
    end
    
    def edit
        @dealerbranch = Dealerbranch.find(params[:id])
    end
    
    
    def update
        @dealerbranch = Dealerbranch.find(params[:id])
        
        if (@dealerbranch.save)
            flash[:success] = "Update Succeeded"
            redirect_to admin_path
        else
            flash[:error] = "Update failed"
            render :edit
        end
        
    end
    
    def destroy
        @dealerbranch = Dealerbranch.find(params[:id])
        @dealerbranch.destroy if (@dealerbranch)
        redirect_to companies_url
    end

   def update_branch_usermenus
        @dealerbranches = Dealerbranch.where(dealercompany_id: params[:company])
        render "dealerusers/update_branch_menus", format: 'js'
    end
    

    
    private
      def dealerbranch_params
        params.require(:dealerbranch).permit(:dealercompany_id, :name)
      end   
end
