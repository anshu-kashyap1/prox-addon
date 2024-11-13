
function mgLocationReload(data) {
    window.location.reload();
}
function mgRedirect(data) {
    if(data.rawData.redirectUrl)
    {
        window.location.href = data.rawData.redirectUrl;
    }
}