<?php


namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update;

use Illuminate\Database\Capsule\Manager as DB;
use ModulesGarden\ProxmoxAddon\App\Models\IpAddress;
use ModulesGarden\ProxmoxAddon\App\Models\KeyPair;
use ModulesGarden\ProxmoxAddon\App\Models\User;
use ModulesGarden\ProxmoxAddon\App\Models\VirtualInterface;
use ModulesGarden\ProxmoxAddon\App\Models\VirtualNetwork;
use ModulesGarden\ProxmoxAddon\App\Models\Vlan;
use ModulesGarden\ProxmoxAddon\App\Models\VmModel;
use ModulesGarden\ProxmoxAddon\App\Models\VmIpAddress;
use ModulesGarden\ProxmoxAddon\App\Models\Whmcs\CustomField;
use ModulesGarden\ProxmoxAddon\App\Models\Whmcs\CustomFieldValue;
use ModulesGarden\ProxmoxAddon\App\Models\Whmcs\EmailTemplate;
use ModulesGarden\ProxmoxAddon\App\Models\Whmcs\Hosting;
use ModulesGarden\ProxmoxAddon\App\Models\Whmcs\Product;
use ModulesGarden\ProxmoxAddon\Core\Configuration\Addon\Update\Patch\AbstractPatch;

class DefaultPatch extends AbstractPatch
{

    public function up()
    {
        //install email templates
        $this->templates();

    }

    protected function templates()
    {
        //Service Creation Failed
        if (EmailTemplate::ofAdmin()->ofName('Service Creation Failed')->count() == 0)
        {
            $entity = new EmailTemplate();
            $entity->fill(
                [
                    "type"    => "admin",
                    "name"    => "Service Creation Failed",
                    "subject" => "Service Creation Failed",
                    "custom"  => 1,
                    "message" => "<p>This product/service automatic provisioning has failed and requires you to manually check & resolve.</p>\n"
                                 . "<p>Client ID: {\$client_id}<br />Service ID: {\$service_id}<br />Product/Service: {\$service_product}<br />Domain: {\$service_domain}<br />Error: {\$error_msg}</p>\n"
                                 . "<p>{\$whmcs_admin_link}</p>\n"
                ]
            )->save();
        }
        //Service Created Successfully
        if (EmailTemplate::ofAdmin()->ofName('Service Created Successfully')->count() == 0)
        {
            $entity = new EmailTemplate();
            $entity->fill(
                [
                    "type"    => "admin",
                    "name"    => "Service Created Successfully",
                    "subject" => "Service Created Successfully",
                    "custom"  => 1,
                    "message" => "<p>Virtual Machine has been successfully provisioned.</p>\n"
                        . "<p>Client ID: {\$client_id}<br />Service ID: {\$service_id}<br />Product/Service: {\$service_product}<br />Domain: {\$service_domain}</p>\n"
                        . "<p>{\$whmcs_admin_link}</p>\n"
                ]
            )->save();
        }
        //Manual Upgrade Request
        if (EmailTemplate::ofAdmin()->ofName('Manual Upgrade Request')->count() == 0)
        {
            $entity = new EmailTemplate();
            $entity->fill(
                [
                    "type"    => "admin",
                    "name"    => "Manual Upgrade Request",
                    "subject" => "Manual Upgrade Request",
                    "custom"  => 1,
                    "message" => "<p>An upgrade order has received its payment, automatic upgrades  has been disabled and requires manually processing.</p>\n"
                                 . "<p>Client ID: {\$client_id}<br />Service ID: {\$service_id}<br />Product/Service: {\$service_product}<br />Domain: {\$service_domain}</p>\n"
                                 . "<p>{\$whmcs_admin_link}</p>\n"
                ]
            )->save();
        }
        //Resource Notification
        if (EmailTemplate::ofProduct()->ofName('Resource Notification')->count() == 0)
        {
            $entity = new EmailTemplate();
            $entity->fill(
                [
                    "type"    => "product",
                    "name"    => "Resource Notification",
                    "subject" => "Resource Notification",
                    "custom"  => 1,
                    "message" => "<p>Resources limits defined in {$notification_name} notification have been exceeded by the <a href='{$whmcs_url}clientarea.php?action=productdetails&id={$service_id}'>{$service_domain}</a> virtual machine:</p>\n"
                        . "<ul>
{if \$cpu_usage}
   <li>Current CPU Usage: {\$cpu_usage.current}%, defined limit: {\$cpu_usage.limit}%</li>
{/if}
{if \$memory_usage}
   <li>Current Memory Usage: {\$memory_usage.current}%, defined limit: {\$memory_usage.limit}%</li>
{/if}
{if \$network_traffic}
   <li>Current Network Usage: {\$network_traffic.current}%, defined limit: {\$network_traffic.limit}%</li>
{/if}
{if \$disk_read}
   <li>Current Disk Read: {\$disk_read.current}%, defined limit: {\$disk_read.limit}%</li>
{/if}
{if \$disk_write}
   <li>Current Disk Write: {\$disk_write.current}%, defined limit: {\$disk_write.limit}%</li>
{/if}
</ul>\n"
                        . "<p>{\$signature}</p>\n"
                ]
            )->save();
        }
        //Backup Schedule
        if (EmailTemplate::ofProduct()->ofName('Backup Schedule')->count() == 0)
        {
            $entity = new EmailTemplate();
            $entity->fill(
                [
                    "type"    => "product",
                    "name"    => "Backup Schedule",
                    "subject" => "Backup Schedule {if \$error_message}Failed{else}Success{/if}",
                    "custom"  => 1,
                    "message" => "{if \$error_message} <p>Backup creation for <a href='{\$whmcs_url}clientarea.php?action=productdetails&id={\$service_id}'>{\$service_domain}</a> has ended with error:<br>{\$error_message}</p>"
                        . "{else} <p>Backup creation for <a href='{\$whmcs_url}clientarea.php?action=productdetails&id={\$service_id}'>{\$service_domain}</a> has ended successfully</p>{/if}"
                        . "<p>{\$signature}</p>\n"
                ]
            )->save();
        }
        //Task Notification Message
        if (EmailTemplate::ofAdmin()->ofName('Task Repetition Threshold - First Notification')->count() == 0)
        {
            $entity = new EmailTemplate();
            $entity->fill(
                [
                    "type"    => "admin",
                    "name"    => "Task Repetition Threshold - First Notification",
                    "subject" => "Info: Task Repetition Threshold Reached",
                    "custom"  => 1,
                    "message" => "<p>Hello,</p>\n"
                        . "<p>We would like to bring to your attention that the task: {\$task_name} with ID number: (#{\$task_id}) has hit its repetition threshold.</p>\n"
                        . "<p>Please review the task and take any necessary actions.</p>\n"
                        . "<p>Client ID: {\$client_id}<br />Service ID: {\$service_id}<br />Product/Service: {\$service_product}<br />Domain: {\$service_domain}<br />Error: {\$error_msg}</p>\n"
                        . "<p>{\$whmcs_admin_link}</p>\n"
                ]
            )->save();
        }
        //Task Warning Message
        if (EmailTemplate::ofAdmin()->ofName('Task Repetition Threshold - Second Notification')->count() == 0)
        {
            $entity = new EmailTemplate();
            $entity->fill(
                [
                    "type"    => "admin",
                    "name"    => "Task Repetition Threshold - Second Notification",
                    "subject" => "Warning: Task Repetition Threshold Exceeded",
                    "custom"  => 1,
                    "message" => "<p>Hello,</p>\n"
                        . "<p>We would like to inform you that the task: {\$task_name} with ID number: (#{\$task_id}) has exceeded its repetition threshold.</p>\n"
                        . "<p>Please address this situation and take any necessary steps.</p>\n"
                        . "<p>Client ID: {\$client_id}<br />Service ID: {\$service_id}<br />Product/Service: {\$service_product}<br />Domain: {\$service_domain}<br />Error: {\$error_msg}</p>\n"
                        . "<p>{\$whmcs_admin_link}</p>\n"
                ]
            )->save();
        }
        //Task Urgent Message
        if (EmailTemplate::ofAdmin()->ofName('Task Repetition Threshold - Third Notification')->count() == 0)
        {
            $entity = new EmailTemplate();
            $entity->fill(
                [
                    "type"    => "admin",
                    "name"    => "Task Repetition Threshold - Third Notification",
                    "subject" => "Urgent: Task Repetition Threshold Exceeded",
                    "custom"  => 1,
                    "message" => "<p>Hello,</p>\n"
                        . "<p>This email aims to inform you that the task: {\$task_name} with ID number: (#{\$task_id}) has now exceeded its repetition threshold.</p>\n"
                        . "<p>Your prompt attention to this issue is crucial to prevent any further complications or delays.</p>\n"
                        . "<p>Client ID: {\$client_id}<br />Service ID: {\$service_id}<br />Product/Service: {\$service_product}<br />Domain: {\$service_domain}<br />Error: {\$error_msg}</p>\n"
                        . "<p>{\$whmcs_admin_link}</p>\n"
                ]
            )->save();
        }
    }

    public function vmIpAddresses()
    {
        try
        {
            $query = DB::table("proxmoxVPS_IP");
            foreach ($query->get() as $entery)
            {
                if (VmIpAddress::ofHostingId($entery->hid)->ofIp($entery->ip)->count()) {
                    continue;
                }
                $entity             = new VmIpAddress();
                $entery->hosting_id = $entery->hid;
                $entity->fill((array)$entery)
                    ->save();
            }
        }
        catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

    public function vlans()
    {
        $tcfv = (new CustomFieldValue())->getTable();
        $tcf = (new CustomField())->getTable();
        $customFields = CustomField::where('fieldname', 'like', 'VLAN Tag|%')->where('type', 'product');

        $vlantags = CustomFieldValue::select("{$tcfv}.value", "{$tcfv}.relid as hosting_id", "{$tcf}.relid")
            ->join($tcf, "{$tcfv}.fieldid", '=', "{$tcf}.id")
            ->whereIn('fieldid', $customFields->pluck('id')->toArray())
            ->get();

        foreach ($vlantags as $vlantag) {
            if (!is_numeric($vlantag->value)) {
                continue;
            }

            $hostingId = $vlantag->hosting_id;

            $vmid = CustomFieldValue::where('fieldid', CustomField::where('relid', $vlantag->relid)->where('fieldname', 'like', 'vmid|%')->first()->id)->where('relid', $hostingId)->first()->value;
            $hosting = Hosting::ofId($hostingId)->first();
            $serverId = $hosting->server;
            $userId = $hosting->userid;

            if (!is_numeric($vmid) || !is_numeric($serverId) || !is_numeric($userId)) {
                continue;
            }

            Vlan::create([
                'server_id' => $serverId,
                'user_id' => $userId,
                'hosting_id' => $hostingId,
                'vm_id' => $vmid,
                'vlan_tag' => $vlantag->value
            ]);
        }
    }

    public function keyPairs()
    {
        try
        {
            $query = DB::table("proxmoxvps_key_pairs");
            foreach ($query->get() as $entery)
            {
                if(KeyPair::ofHostingId($entery->hosting_id)->count()){
                    continue;
                }
                $entity = new KeyPair();
                $entity->fill((array)$entery)
                    ->save();
            }
        }
        catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

    public function users()
    {
        try
        {
            $query = DB::table("proxmoxVPS_Users");
            foreach ($query->get() as $entery)
            {
                if(User::ofHostingId($entery->hosting_id)->where("username", $entery->username )->count()){
                    continue;
                }
                $entity = new User();
                $entity->fill((array)$entery)
                         ->save();
            }
        }
        catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

    /**
     * Import VMs from Proxmox Cloud
     * @throws \Exception
     */
    public function vms()
    {
        try
        {
            $query = DB::table("proxmoxcloud_vservers");
            $query->where('hosting_id', 8053);
            foreach ($query->get() as $entery)
            {
                if(VmModel::ofHostingId($entery->hosting_id)->ofVmid($entery->vmid)->count()){
                    continue;
                }
                if(!Hosting::ofId($entery->hosting_id)->activeAndSuspended()->count()){
                    continue;
                }
                $vm = new VmModel;
                $vm->fill((array)$entery);
                $vm->name = $entery->hostname;
                $vm->disk = $entery->storage_usage;
                $vm->disks = (int) $entery->hdds;
                $vm->virtualization = $entery->type;
                $vm->memory = $entery->memory_usage;
                $vm->sockets = $entery->sockets_usage;
                $vm->cores = $entery->cpu_cores_usage;
                $vm->cpuunits = $entery->cpu_weigh_usage;
                $vm->swap = $entery->swap_usage;
                $vm->cpulimit = $entery->cpu_limit;
                $vm->virtualization = str_replace('kvm','qemu',$entery->type);
                $vm->save();
                //ips
                $this->vmIps($vm, $entery);
                $this->vmPrivateInterfaces($vm, $entery);
                //keys
                $this->vmKeyPairs($vm, $entery);
            }
        }
        catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

    /**
     * @throws \Exception
     * Import ip addresses from proxmox cloud
     */
    public function vmIps(VmModel $vmModel, $vserver)
    {
        try
        {
            $query = DB::table("proxmoxcloud_ips")->where('vid', $vserver->id);
            foreach ($query->get() as $entery)
            {
                $hostingModel = Hosting::ofId($entery->hid)->firstOrFail();
                $hostingModel->ipUpdate($entery->ip)->save();

                if (VmIpAddress::ofHostingId($vmModel->hosting_id)->ofIp($entery->ip)->count()) {
                    continue;
                }
                //public ip only
                if(!filter_var($entery->ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE)){
                    continue;
                }
                $entity             = new VmIpAddress();
                $entery->hosting_id =  $vmModel->hosting_id;
                $entery->server_id = $entery->sid;
                $entery->vm_id = $vmModel->id;
                $entity->fill((array)$entery)
                       ->save();
                //VI
                $vi = new VirtualInterface();
                $vi->vn_id = 0;
                $vi->ip = $entity->ip;
                if(preg_match('/\./', $entity->ip)){
                    $vi->ip_long = ip2long($entity->ip);
                }
                $vi->vm_id = $vmModel->id;
                $vi->hosting_id = $vmModel->hosting_id;
                $vi->net = (string)$entity->net;
                $vi->save();
            }
        }
        catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

    public function vmKeyPairs(VmModel $vmModel, $vserver)
    {
        try
        {
            $query = DB::table("proxmoxcloud_key_pairs")->where('vserver_id', $vserver->id);
            foreach ($query->get() as $entery)
            {
                if(KeyPair::ofHostingId($entery->hosting_id)->where('vm_id',$vmModel->id)->count()){
                    continue;
                }
                $entity = new KeyPair();
                $entery->vm_id = $vmModel->id;
                $entity->fill((array)$entery)
                    ->save();
            }
        }
        catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

    public function productCloud()
    {
        try
        {
            $productConveter = new ProductCloudConveter();
            $query = DB::table("proxmoxCloud_prodConfig");
            foreach ($query->get() as $row)
            {
                if(!Product::where('id',$row->product_id )->count()){
                    continue;
                }
                $setting = $productConveter->convert($row->setting, $row->value, $row->product_id);
                if (is_null($setting))
                {
                    continue;
                }

                if ($productConveter->exist($setting))
                {
                    continue;
                }
                $setting->save();
            }
        }
        catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }

    }

    protected function usersCloud(){
        try {
            foreach (Hosting::ofProxmoxCloudAndStatusActiveAndSuspended()->get() as $hosting) {
                if (User::ofHostingId($hosting->id)->count()) {
                    continue;
                }
                $realm = $query = DB::table("proxmoxCloud_prodConfig")
                    ->where('product_id', $hosting->packageid)
                    ->where('setting','realm')
                    ->value('value');
                $entity = new User();
                $entity->user_id = $hosting->userid;
                $entity->hosting_id = $hosting->id;
                $entity->username = $hosting->username;
                $entity->password = $hosting->password;
                $entity->realm = $realm ? $realm : 'pve';
                $entity->save();
            }
        }catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

    public function vmPrivateInterfaces(VmModel $vmModel, $vserver)
    {
        try
        {
            $query = DB::table("proxmoxcloud_private_interfaces")->where('vserver_id', $vserver->id);
            foreach ($query->get() as $entery)
            {
                if (VirtualInterface::ofHostingId($vmModel->hosting_id)->ofIp($entery->ip)->ofVmId($vmModel->id)->count()) {
                    continue;
                }
                $network = DB::table("proxmoxcloud_private_networks")->where('id', $entery->network_id)->first();
                $ip = IpAddress::find($entery->ip_id);
                if(VirtualNetwork::ofHostingId( $vmModel->hosting_id)->ofTag($network->vlan_tag)->count() ==0){
                    $vn = new  VirtualNetwork;
                    $vn->name =   $network->name;
                    $vn->tag =   $network->vlan_tag;
                    $vn->hosting_id =   $network->hosting_id;
                    $vn->pool = $entery->ip;
                    $vn->cidr = $ip->cidr;
                    $vn->gateway = $ip->gateway;
                    $vn->save();
                }else{
                    $vn =  VirtualNetwork::ofHostingId( $vmModel->hosting_id)->ofTag($network->vlan_tag)->first();
                }
                //VI
                $vi = new VirtualInterface();
                $vi->vn_id = $vn->id;
                $vi->ip = $entery->ip;
                if(preg_match('/\./',  $entery->ip)){
                    $vi->ip_long = ip2long( $entery->ip);
                }
                $vi->vm_id = $vmModel->id;
                $vi->hosting_id = $vmModel->hosting_id;
                $vi->net =  $entery->device;
                $vi->save();
                $ip->hosting_id = 0 ;
                $ip->save();
            }
        }
        catch (\Exception $ex)
        {
            print_r($ex); die();
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

}
