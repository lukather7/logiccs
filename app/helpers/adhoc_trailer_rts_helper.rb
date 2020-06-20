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
  
  def makearray_Brotation(trailer)
     r = trailer.adhocTrailerRts.select("tire1sn", "tire2sn", "tire3sn",
       "tire4sn", "tire5sn", "tire6sn", "tire7sn", "tire8sn", "tire9sn",
       "tire10sn", "tire11sn", "tire12sn", "tire13sn").last 
       
      a = [ r.tire1sn, r.tire2sn, r.tire3sn, r.tire4sn, r.tire5sn,
         r.tire6sn, r.tire7sn, r.tire8sn, r.tire9sn, r.tire10sn,
         r.tire11sn, r.tire12sn, r.tire13sn ]
         
         a.each_index do |index| 
           if (a[index] == nil)
             a[index] = ""
           end
         end
         
      return a
  end
  
end
