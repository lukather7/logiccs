class BranchesController < ApplicationController
    
    def update_branch_menus
        @branches = Branch.where(company_id: params[:company])
        @kind = params[:object]
        render 'update_branch_menus', format: 'js'
    end
    
    def test
    end
end