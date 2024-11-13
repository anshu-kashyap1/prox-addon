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
            <p>{$MGLANG->T('Product/Service Related:')}
                {literal}
            <pre>{$userid} {$serviceid} {$domain} {$username} {$password} {$passwordHash} {$cipasswordHash} {$model->dedicatedip} {$model->assignedips} {$customfields.sshkeys} {$ipv4Addresses} {$ipv6Addresses}</pre>
            {/literal}
            </p>
            <p>{$MGLANG->T('Proxmox  VE Cloud VPS Related:')}
                {literal}
            <pre>{$vm.id} {$vm.name} {$vm.password} {$vm.passwordHash} {$vm.ipv4Addresses} {$vm.ipv6Addresses} {$vm.ciuser} {$vm.sshkeys}</pre>
            {/literal}
            </p>
        </div>
    </div>
</div>
