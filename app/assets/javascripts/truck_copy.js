function js_param_copy() {
    
    // comment
    
    var company_id = $("#truck_company_id").val();
    var branch_id = $("#truck_branch_id").val();
    var modelname = $("#truck_model").val();
    
    $.ajax({
        url: "/trucks/params_copy",
        type: "POST",
        data: {company : company_id, branch: branch_id, model: modelname},
        dataType: "script",
    });

}