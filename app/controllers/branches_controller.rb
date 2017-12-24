class BranchesController < ApplicationController
    
    def update_branch_menus
        @branches = Branch.where(company_id: params[:company])
        @model = params[:object].pluralize
        render "#{@model}/update_branch_menus", format: 'js'
    end

   def update_branch_usermenus
        @branches = Branch.where(company_id: params[:company])
        render "users/update_branch_menus", format: 'js'
    end
    
    
   def update_branch_truckmenus
        @branches = Branch.where(company_id: params[:company])
        render "trucks/update_branch_menus", format: 'js'
    end
    
    
    def index
        @branches = branch.all.order("created_at DESC");
    end
    
    def new
        @branch = Branch.new  
    end
    
    def create
        @branch = Branch.new(branch_params)
        if @branch.save
         flash[:success] = "Welcome to LOGICCS !"    
         redirect_to admin_path
        else
         flash[:danger] = "regist failed !"    
         render 'new'
        end 
    end
    
    def index
        @branch = Branch.all.order("created_at ASC")
    end
    
    private
      def branch_params
        params.require(:branch).permit(:name, :company_id)
      end   
end
 