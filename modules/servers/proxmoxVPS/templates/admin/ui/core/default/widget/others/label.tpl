<span 
    {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach} class="{$rawObject->getClasses()}" 
    {if $rawObject->getMessage()} data-toggle="lu-tooltip" data-title="{$rawObject->getMessage()}" {/if}
    style="background-color: #{$rawObject->getBackgroundColor()}; color: #{$rawObject->getColor()};" >{$rawObject->getTitle()}
</span> 