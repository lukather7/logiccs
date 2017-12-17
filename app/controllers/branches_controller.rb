class BranchesController < ApplicationController
    
    def update_branch_menus
        @branches = Branch.where(company_id: params[:company])
        @kind = params[:object]
        render 'update_branch_menus', format: 'js'
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
        params.require(:branch).permit(:name_e, :name_j, :company_id)
      end   
end
 