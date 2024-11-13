//replace url wrapper
var mgUrlParser = {
    oldMgUrlParser: mgUrlParser,

    getCurrentUrl: function () {
        var url = this.oldMgUrlParser.getCurrentUrl();
        return url.replace("action=edit", "action=module-settings").replace("&success=true", "");
    }
};
//change virtualization
$(document).on("click", ".virtualizationChangeConfirmButton", function (event) {
    event.preventDefault();
    $("form[name=packagefrm]").submit();
});
$(document).on("change", "select[name='customconfigoption[virtualization]']", function () {
    document.getElementById("virtualizationChangButton").click();
});
//default node
$(document).on("change", "select[name='customconfigoption[defaultNode]']", function () {
    $("form[name=packagefrm]").submit();
});
// Disk Speed
$(document).on("change", "input[name='customconfigoption[diskSpeed]']", function (e) {
    var show = $(this).is(":checked");
    $("input[name='customconfigoption[mbps_rd]']").closest(".lu-widget").toggle(show);
});
if ($("input[name='customconfigoption[diskSpeed]']").size()) {
    $("input[name='customconfigoption[diskSpeed]']").trigger('change');
}
//Additional Disk Speed
$(document).on("change", "input[name='customconfigoption[additionalDiskSpeed]']", function (e) {
    var show = $(this).is(":checked");
    $("input[name='customconfigoption[additionalDiskMbps_rd]']").closest(".lu-widget").toggle(show);
});
if ($("input[name='customconfigoption[additionalDiskSpeed]']").size()) {
    $("input[name='customconfigoption[additionalDiskSpeed]']").trigger('change');
}
//Storage LVM
$(document).on("change", "select[name='customconfigoption[diskStorage]']",function(e){
    var storage = $(this).val();
    if(storage.match(/lvm/)){
        $("select[name='customconfigoption[diskFormat]']").val("raw");
        $("select[name='customconfigoption[diskFormat]'] option").attr("disabled",true);
        $("select[name='customconfigoption[diskFormat]'] option[value=raw]").attr("disabled",false);
    }else{
        $("select[name='customconfigoption[diskFormat]'] option").attr("disabled",false);
    }
});
if ($("input[name='customconfigoption[diskStorage]']").size()) {
    $("input[name='customconfigoption[diskStorage]']").trigger('change');
}
