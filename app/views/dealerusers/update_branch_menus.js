

$('#branch_select').html(
    '<%=  escape_javascript( render partial:"dealerusers/branch_menu", locals:{obj: @kind, dealerbranches: @dealerbranches} ) %>'
);
