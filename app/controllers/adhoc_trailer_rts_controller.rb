class AdhocTrailerRtsController < ApplicationController
    
    def new
        @trailer = Trailer.find(params[:trailer_id])
        @adhoc_tire = @trailer.adhocTrailerRts.build
    end
    
end
