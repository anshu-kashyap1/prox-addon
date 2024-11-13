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
        <div class="widget__header">
            <div class="lu-widget__top lu-top">
                <div class="lu-top__title">
                    {if $rawObject->getIcon()}<i class="{$rawObject->getIcon()}"></i>{/if}
                    {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T($rawObject->getTitle())}{/if}
                </div>
            </div>
        </div>
    {/if}
    <div class="alert alert--sm alert-warning alert--faded datatable-alert-top">
        <div class="alert__body">
            {$MGLANG->tr('alertWarning')}
        </div>
    </div>
    <div class="lu-widget__body">
        <div class="lu-widget__content">
  {literal}
            <pre>#cloud-config
hostname: {$domain}
manage_etc_hosts: true
fqdn: {$domain}
user: {$username}
password: {$passwordHash}
chpasswd:
  expire: False
users:
  - default
package_upgrade: true</pre>
            {/literal}

            {foreach from=$rawObject->getFields() item=field }
                {$field->getHtml()}
            {/foreach}
        </div>
    </div>
</div>
