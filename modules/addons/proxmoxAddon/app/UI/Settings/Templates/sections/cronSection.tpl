{**********************************************************************
* ProxmoxAddon product developed. (2017-10-06)
* *
*
*  CREATED BY MODULESGARDEN       ->       http://modulesgarden.com
*  CONTACT                        ->       contact@modulesgarden.com
*
*
* This software is furnished under a license and may be used and copied
* only  in  accordance  with  the  terms  of such  license and with the
* inclusion of the above copyright notice.  This software  or any other
* copies thereof may not be provided or otherwise made available to any
* other person.  No title to and  ownership of the  software is  hereby
* transferred.
*
*
**********************************************************************}

{**
* @author Sławomir Miśkowicz <slawomir@modulesgarden.com>
*}
<div class="lu-widget">
    {if ($rawObject->getRawTitle() || $rawObject->getTitle()) && $rawObject->isViewHeader()}
        <div class="lu-widget__header">
            <div class="lu-widget__top top">
                <div class="lu-top__title">
                    {if $rawObject->getIcon()}<i class="{$rawObject->getIcon()}"></i>{/if}
                    {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T($rawObject->getTitle())}{/if}
                </div>
            </div>
        </div>
    {/if}
    {if $rawObject->haveInternalAlertMessage()}
        <div class="lu-alert {if $rawObject->getInternalAlertSize() !== ''}lu-alert--{$rawObject->getInternalAlertSize()}{/if} lu-alert--{$rawObject->getInternalAlertMessageType()} lu-alert--faded modal-alert-top">
            <div class="lu-alert__body">
                {if $rawObject->isInternalAlertMessageRaw()|unescape:'html'}{$rawObject->getInternalAlertMessage()}{else}{$MGLANG->T($rawObject->getInternalAlertMessage())|unescape:'html'}{/if}
            </div>
        </div>
    {/if}
    <div class="lu-widget__body">
        <div class="lu-widget__content">
            <p>{$MGLANG->T('The cron job for Proxmox VE VPS & Proxmox  VE Cloud VPS (each 5 minutes suggested):')}
            <pre>php -q {$customTplVars.crons.vps}</pre>
            </p>
            {if $customTplVars.proxmoxCloudVps}
            <p>{$MGLANG->T('The cron job for Proxmox  VE Cloud VPS (each hour suggested):')}
            <pre>php -q {$customTplVars.crons.cloud}</pre>
            </p>
            {/if}
            <p>{$MGLANG->T('The cron job for backups synchronization (each 5 minutes suggested):')}
            <pre>php -q {$customTplVars.crons.backupSync}</pre>
            </p>
            <p>{$MGLANG->T('The cron job for users synchronization (run only once):')}
            <pre>php -q {$customTplVars.crons.users}</pre>
            </p>
            <p>{$MGLANG->T('The cron job for VM recovery synchronization:')}
            <pre>php -q {$customTplVars.crons.recoveryList}</pre>
            </p>
            <p>{$MGLANG->T('The cron job for VMs migration synchronization:')}
            <pre>php -q {$customTplVars.crons.migrateSync}</pre>
            </p>
            <p>{$MGLANG->T('Cron job tasks synchronization:')}
            <pre>php -q {$customTplVars.crons.task}</pre>
            </p>
            <p>{$MGLANG->T('Cron job vms power tasks:')}
            <pre>php -q {$customTplVars.crons.powerTasks}</pre>
            </p>
            <p>{$MGLANG->T('Cron job resources notifications:')}
            <pre>php -q {$customTplVars.crons.resourcesNotifications}</pre>
            </p>
            <p>{$MGLANG->T('Cron job update server usage (each 5 minutes suggested):')}
            <pre>php -q {$customTplVars.crons.usege}</pre>
            {if $customTplVars.proxmoxVps}
                <p>{$MGLANG->T('Cron job remove backups (each 24 hours suggested):')}
                <pre>php -q {$customTplVars.crons.backup}</pre>
                </p>
                <p>{$MGLANG->T('The cron job backup schedules (optional, each 5 minutes suggested):')}
                <pre>php -q {$customTplVars.crons.backupSchedule}</pre>
                </p>
                <p>{$MGLANG->T('The cron job for migration backup jobs into backup schedules (optional, run only once per product):')}
                <pre>php -q {$customTplVars.crons.migrateBackupJobsToSchedules}</pre>
                </p>
            {/if}
            <p>{$MGLANG->T('Cron job snapshot jobs (optional, each 5 minutes suggested):')}
            <pre>php -q {$customTplVars.crons.snapshots}</pre>
            </p>
            <p>{$MGLANG->T('Cron job for removing the snapshots (optional, each 24 hours suggested):')}
            <pre>php -q {$customTplVars.crons.removeSnapshots}</pre>
            </p>
            <p>{$MGLANG->T('The cron job for VM names synchronization (run only once):')}
            <pre>php -q {$customTplVars.crons.vmNames}</pre>
            </p>
        </div>
    </div>
</div>
