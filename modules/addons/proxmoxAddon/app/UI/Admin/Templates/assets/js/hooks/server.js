var proxmoxVPS_td1;
var proxmoxVPS_td2;
var proxmoxVPS_accesshash;
var proxmoxVPS_selectAdded = false;

function proxmoxVPS_addSelect(){

    var accessTd = $(  "#inputServerType").closest("tbody").find(" tr:eq(3)").find(" td:eq(0)");
    proxmoxVPS_td1 = accessTd.html();
    accessTd.html("Authentication");

    var accessInput = $(  "#inputServerType").closest("tbody").find(" tr:eq(3)").find(" td:eq(1)");
    proxmoxVPS_td2 = accessInput.html();
    accessInput.html("<select name=\"accesshash\"><option value=\"pam\">Linux PAM standard authentication</option><option value=\"pve\">Proxmox VE authentication server</option><option value=\"PVEAPIToken\" hidden>API Tokens</option></select>");
    proxmoxVPS_accesshash ? $("select[name='accesshash']").val(proxmoxVPS_accesshash): $("select[name='accesshash']").val("pam")
    proxmoxVPS_selectAdded = true;

}

function proxmoxVPS_removeSelect(){
    $( "#inputServerType").closest("tbody").find(" tr:eq(3)").find(" td:eq(0)").html(proxmoxVPS_td1);
    $(  "#inputServerType").closest("tbody").find(" tr:eq(3)").find(" td:eq(1)").html(proxmoxVPS_td2);
    proxmoxVPS_selectAdded = false
}

$(document).ready(function(){

    var pc_ServerType =  $( "#inputServerType").val();

    proxmoxVPS_accesshash = $( "textarea[name='accesshash']").val();
    if(pc_ServerType=="proxmoxVPS" || pc_ServerType=="ProxmoxCloudVps"){
        proxmoxVPS_addSelect();
    }

    $( "#inputServerType").change(function(){
        pc_ServerType = $( this).val();

        if(proxmoxVPS_selectAdded==true &&  pc_ServerType!="proxmoxVPS" && pc_ServerType!="ProxmoxCloudVps"   ){
            proxmoxVPS_removeSelect();
        }else if(!proxmoxVPS_selectAdded && pc_ServerType=="proxmoxVPS" || pc_ServerType=="ProxmoxCloudVps"  ){
            proxmoxVPS_addSelect();
        }

    });
});
