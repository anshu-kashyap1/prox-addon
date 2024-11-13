
function mgLocationReload(data) {
    window.location.reload();
}

function pmToggleButton(data) {
    let button = $("#backupDataTable .lu-top__toolbar a");
    if(data.htmlData.createButtonStatus)
    {
        button.removeClass('disabled');
    }
    else
    {
        button.addClass('disabled');
    }
}

$(".mg-wrapper").on("click", ".dt-button", function () {
    mgPageControler.vueLoader.refreshingState = ['resourcesContainer'];
    mgPageControler.vueLoader.runRefreshActions();
});

function turnOffSwitch(data, targetId, event)
{
    $(event.target).attr("checked", false);
}