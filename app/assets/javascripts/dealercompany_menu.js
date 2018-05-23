function update_branchForDealeruser(val, objectkind) {
    
   $.ajax({
        url: "/dealerbranches/update_branch_usermenus",
        type: "POST",
        data: {company : val},
        dataType: "script",
    });

}
