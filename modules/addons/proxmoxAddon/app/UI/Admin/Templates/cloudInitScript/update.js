function pkOnCloudInitScriptCreatedAjaxDone(data) {
    var id = data['htmlData']['id'];
    $("#cloudInitScriptContainter input[name=id]").val(id);
}