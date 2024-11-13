
$(document).on("click", ".sshPrivateKeyDownloadButton", function () {

    $('#serviceInformationDataTable').find('table tr:last').hide();
});

function mgRedirect(data) {
    if(data.rawData.redirectUrl)
    {
        window.location.href = data.rawData.redirectUrl;
    }
}

function restartButtonState(data)
{
    if (data.htmlData.disabled)
    {
        $('#rebootButton').addClass('disabled');
    }
    else
    {
        $('#rebootButton').removeClass('disabled');
    }
}