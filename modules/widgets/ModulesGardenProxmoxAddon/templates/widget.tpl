<script type="text/javascript">
    function MGProxmoxAddonWidget() {
        $("#MGProxmoxAddonWidget").html("<p style=\"text-align: center\"><img src=\"images/loading.gif\"/></p>");
        $.post(document.location.toString(), "GetMGProxmoxAddonWidgetContent=1&ajax=1", function (data) {
            var MGLoadWidget = new Promise(function(resolve, reject) {
                $("#MGProxmoxAddonWidget").html(data);
                resolve(1);
            });
        });
    }
    $(function () {
        MGProxmoxAddonWidget();
    });
</script>
<style>
    #MGProxmoxAddonWidget{
        height: 300px;
    }
</style>
<div id="MGProxmoxAddonWidget" class="widget-content-padded"></div>
