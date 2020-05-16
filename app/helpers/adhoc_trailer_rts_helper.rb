module AdhocTrailerRtsHelper
    
  def adhoc_trailer_lasttire(trailer, index)
    @adhoc_tirelist =  trailer.adhocTrailerRts.order("created_at")
    if (@adhoc_tirelist.count < index)
        return link_to("--", new_adhoc_trailer_rt_path(trailer_id: trailer), class: "btn btn-success btn-xs text-center",
          data:{toggle:"modal", target:"#modal-example"}, remote:true)
    else
        date = @adhoc_tirelist[index - 1].date
        if (date != nil)
          return link_to(date.strftime("%Y/%m/%d"), edit_adhoc_trailer_rt_path(@adhoc_tirelist[index - 1]), remote: true)
        else
          return link_to("---", edit_adhoc_trailer_rt_path(@adhoc_tirelist[index - 1]), remote: true)
        end
    end
  end
    
  def get_trailer_adhoctire_data(trailer, index)
    @adhoc_tirelist =  trailer.adhocTrailerRts.order("created_at")
    if (@adhoc_tirelist.count < index)
      return nil
    else
      @adhoc_tirelist[index - 1]
    end
    
  end
  
end
