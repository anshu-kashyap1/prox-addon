function mgBytesToSize(bytes) {
    var sizes = ['Bytes', 'KiB', 'MiB', 'GiB', 'TiB'];
    if (bytes <= 1) {
        if (bytes !== 0) {
            var bytes = Number(bytes).toFixed(1);
        }
        return bytes + ' Byte';
    }
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    var total = bytes / Math.pow(1024, i) ;
    if(sizes[i] == 'GiB' || sizes[i] == 'TiB' ){
        return total.toFixed(2)+ ' ' + sizes[i];
    }
    return Math.round( total, 2) + ' ' + sizes[i];
}

function mgTooltipCpu(tooltipItem, data) {
    var used = Number(tooltipItem.yLabel).toFixed(2);
    return used + "%";
}

function mgTooltipServerLoad(tooltipItem, data) {
    var used = Number(tooltipItem.yLabel).toFixed(2);
    return used;
}

function mgTooltipCallbackForMemory(tooltipItem, data) {
    return mgBytesToSize(tooltipItem.yLabel);
}

function mgTooltipCallbackForNet(tooltipItem, data) {
    return mgBytesToSize(tooltipItem.yLabel);
}

function mgTooltipCallbackForDisk(tooltipItem, data) {
    return mgBytesToSize(tooltipItem.yLabel);
}