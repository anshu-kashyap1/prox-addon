<div class="lu-modal show" id="confirmationModal">
    <div class="lu-modal__dialog">
        <div class="lu-modal__content" id="mgModalContainer">
            <div class="lu-modal__top lu-top">
                <div class="lu-top__title lu-type-6">
                    <span class="lu-text-faded lu-font-weight-normal">
                {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T('modal', $rawObject->getTitle())}{/if}
            </span>
                </div>
                <div class="lu-top__toolbar">
                    <button class="lu-btn lu-btn--xs lu-btn--icon lu-btn--link lu-btn--plain closeModal" @click="closeModal($event)" data-dismiss="lu-modal" aria-label="Close">
                        <i class="lu-btn__icon lu-zmdi lu-zmdi-close"></i>
                    </button>
                </div>
            </div>
            {assign var="addForm" value=$rawObject->getForm('ipManagementCreateForm')}
            <div class="lu-modal__nav">
                <ul class="lu-nav lu-nav--md lu-nav--h lu-nav--tabs">
                    {assign var="sectArrKeys" value=$addForm->getSections()|array_keys}
                    {foreach from=$addForm->getSections() key=sectionID  item=section }
                        <li class="lu-nav__item {if $sectArrKeys[0] == $sectionID}is-active{/if}">
                            <a class="lu-nav__link" data-toggle="lu-tab" href="#modalTab{$sectionID}">
                                <span class="lu-nav__link-text">{$MGLANG->T($section->getTitle())}</span>
                            </a>
                        </li>
                    {/foreach}
                </ul>
            </div>
            <div class="lu-modal__body">
                <form id="{$addForm->getId()}" namespace="{$addForm->getNamespace()}" index="{$addForm->getIndex()}" mgformtype="{$addForm->getFormType()}">
                    {foreach from=$addForm->getFields() item=field }
                        {$field->getHtml()}
                    {/foreach}
                    <div class="lu-tab-content">
                        {assign var="sectArrKeys" value=$addForm->getSections()|array_keys}
                        {foreach from=$addForm->getSections() key=sectionID  item=section }
                            <div class="lu-tab-pane {if $sectArrKeys[0] == $sectionID}is-active{/if}" id="modalTab{$sectionID}">
                                <div class="lu-list-group--simple lu-list-group--p-h-0x lu-list-group--collapse lu-m-b-0x">
                                    {$section->getHtml()}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </form>
            </div>
            <div class="lu-modal__actions">
                {foreach from=$rawObject->getActionButtons() item=actionButton}
                    {$actionButton->getHtml()}
                {/foreach}
            </div>
            {if ($isDebug eq true AND (count($MGLANG->getMissingLangs()) != 0))}
                {literal}
                    <div class="lu-modal__actions">
                    <div class="lu-row">
                {/literal}
                {foreach from=$MGLANG->getMissingLangs() key=varible item=value}
                    {literal}<div class="lu-col-md-12"><b>{/literal}{$varible}{literal}</b> = '{/literal}{$value}{literal}';</div>{/literal}
                {/foreach}
                {literal}
                    </div>
                    </div>
                {/literal}
            {/if}
        </div>
    </div>
</div>