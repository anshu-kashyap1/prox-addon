{**********************************************************************
* ProxmoxAddon product developed. (2017-11-16)
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
<div class="lu-modal show lu-modal--{$rawObject->getModalSize()}" id="confirmationModal"
     namespace="{$rawObject->getNamespace()}" index="{$rawObject->getId()}">
    <div class="lu-modal__dialog">
        <div class="lu-modal__content" id="mgModalContainer">
            <div class="lu-modal__top lu-top">
                <div class="lu-top__title lu-type-6">
                    <span class="lu-text-faded lu-font-weight-normal">
                {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T('modal', $rawObject->getTitle())}{/if}
            </span>
                </div>
                <div class="lu-top__toolbar">
                    <button class="lu-btn lu-btn--xs lu-btn--default lu-btn--icon lu-btn--link lu-btn--plain closeModal"
                            data-dismiss="lu-modal" aria-label="Close" @click='closeModal($event)'>
                        <i class="lu-btn__icon lu-zmdi lu-zmdi-close"></i>
                    </button>
                </div>
            </div>
            <div class="lu-modal__body">
                <div class="lu-col-md-12">
                    <ul class="lu-list lu-list--info">
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('ID')}</span>
                            <span class="lu-list__value"> {$customTplVars.network.id} </span>
                        </li>
                        {if $customTplVars.network.name}
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->tr('Name')} </span>
                                 <span class="lu-list__value"> {$customTplVars.network.name} </span>
                            </li>
                        {/if}
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('Bridge')}</span>
                            <span class="lu-list__value">{$customTplVars.network.bridge}</span>
                        </li>
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('Firewall')}</span>
                            <span class="lu-list__value">
                                {if $customTplVars.network.firewall}
                                    <span class="lu-label lu-label--success lu-label--status">{$MGLANG->tr('Active')}</span>
                                {else}
                                    <span class="lu-label lu-label--danger lu-label--status">{$MGLANG->tr('Disabled')}</span>
                                {/if}
                            </span>
                        </li>
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('MAC Address')}</span>
                            <span class="lu-list__value">{$customTplVars.network.hwaddr} {$customTplVars.network.macAddress}</span>
                        </li>
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('IP Address')}</span>
                            <span class="lu-list__value">
                                {if !$customTplVars.network.ip && !$customTplVars.network.ip6}
                                    -
                                {elseif $customTplVars.network.ip && $customTplVars.network.cidr }
                                    {$customTplVars.network.ip}/{$customTplVars.network.cidr}
                                    <br/>
                                {elseif $customTplVars.network.ip }
                                    {$customTplVars.network.ip}   <br/>
                                {/if}
                                {if $customTplVars.network.ip6 && $customTplVars.network.cidr6 }
                                    {$customTplVars.network.ip6}/{$customTplVars.network.cidr6}
                                {elseif $customTplVars.network.ip6}
                                    {$customTplVars.network.ip6}
                                {/if}
                            </span>
                        </li>
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('Gateway')}</span>
                            <span class="lu-list__value">
                                {if !$customTplVars.network.gw && !$customTplVars.network.gw6}
                                    -
                                {elseif $customTplVars.network.gw && $customTplVars.network.gw6}
                                    {$customTplVars.network.gw}
                                    <br/>
                                    {$customTplVars.network.gw6}
                                {else}
                                    {$customTplVars.network.gw}
                                    {$customTplVars.network.gw6}
                                {/if}
                            </span>
                        </li>
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('Tag')}</span>
                            <span class="lu-list__value">
                                {if !$customTplVars.network.tag}
                                    -
                                {/if}
                                {$customTplVars.network.tag}
                            </span>
                        </li>
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('Rate')}</span>
                            <span class="lu-list__value">
                                {if $customTplVars.network.rate}
                                    {$customTplVars.network.rate} MB/s {$customTplVars.network.rate*8} (Mbps)
                                {else}
                                    {$MGLANG->tr('Unlimited')}
                                {/if}
                            </span>
                        </li>
                        <li class="lu-list__item">
                            <span class="lu-list__item-title">{$MGLANG->tr('Mtu')}</span>
                            <span class="lu-list__value">
                                {if $customTplVars.network.mtu}
                                    {$customTplVars.network.mtu}
                                {else}
                                    -
                                {/if}
                            </span>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="lu-modal__actions">
                {foreach from=$rawObject->getActionButtons() item=actionButton}
                    {$actionButton->getHtml()}
                {/foreach}
            </div>
            {if ($isDebug eq true AND (count($MGLANG->getMissingLangs()) != 0))}{literal}
                <div class="lu-modal__actions">
                <div class="lu-row">
            {/literal}{foreach from=$MGLANG->getMissingLangs() key=varible item=value}{literal}
                <div class="lu-col-md-12"><b>{/literal}{$varible}{literal}</b> = '{/literal}{$value}{literal}';</div>
            {/literal}{/foreach}{literal}
                </div>
                </div>
            {/literal}{/if}
        </div>
    </div>
</div>
