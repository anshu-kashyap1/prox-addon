<div class="alert {if $rawObject->getInternalAlertSize() !== ''}alert--{$rawObject->getInternalAlertSize()}{/if} alert-{$rawObject->getInternalAlertMessageType()} alert--faded datatable-alert-top" style="width: 100%; margin-top:0px; margin-bottom: 10px !important;">
    <div class="alert__body">
        {if $rawObject->isInternalAlertMessageRaw()|unescape:'html'}{$rawObject->getInternalAlertMessage()}{else}{$MGLANG->T($rawObject->getInternalAlertMessage())|unescape:'html'}{/if}
    </div>
</div>