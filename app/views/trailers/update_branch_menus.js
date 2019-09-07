//
// branch#update_branchメソッドから呼び出され
// HTML内のbranch_selectのinnerHTMLを書き換えることで
// メニュー選択肢を連動させる
//

$('#branch_select').html(
    '<%=  escape_javascript( render partial:"trailers/branch_menu", locals:{obj: @kind, branches: @branches} ) %>'
);
