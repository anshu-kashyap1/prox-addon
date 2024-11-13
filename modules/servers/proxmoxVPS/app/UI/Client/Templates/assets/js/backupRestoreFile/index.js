
function mgDownloadBackupFile(data) {
    if(data.htmlData.redirectUrl)
    {
        window.location.href = data.htmlData.redirectUrl;
    }
}