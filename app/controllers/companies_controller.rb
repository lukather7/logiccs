class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all.order("created_at DESC");
    end
    
    def new
        @company = Company.new
    end
    
    def create
    end
    
end
