<div class="h4 lu-m-b-3x lu-m-t-3x">{$MGLANG->absoluteT('serverCA','home',$rawObject->getId())}</div>
<div class="lu-tiles lu-row lu-row--eq-height">
    {foreach from=$rawObject->getButtons() key=setting item=dataElement}
        <div class="lu-col-sm-20p" style="justify-content: center;">
            <a class="{$dataElement->getClasses()}" href="{$dataElement->getHref()}"   {foreach $dataElement->getHtmlAttributes() as $aValue} {$aValue@key}="{$aValue}"{/foreach}>
                <div class="lu-i-c-6x">
                    {if $dataElement->getImageUrl()}
                        <img src="{$dataElement->getImageUrl()}"
                             alt="{$MGLANG->absoluteT('serverCA' , 'iconTitle' , $dataElement->getId())}"/>
                    {/if}
                </div>
                <div class="lu-tile__title">{$MGLANG->absoluteT('serverCA' , 'iconTitle' , $dataElement->getId())}</div>
            </a>
        </div>
    {/foreach}
</div>

