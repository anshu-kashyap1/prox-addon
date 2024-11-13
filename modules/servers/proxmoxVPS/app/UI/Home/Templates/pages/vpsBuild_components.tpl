<script type="text/x-template" id="t-mg-vpsBuild-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="lu-row lu-row--eq-height {$rawObject->getClasses()}" id="{$rawObject->getId()}" namespace="{$namespace}"
         index="{$rawObject->getIndex()}" actionid="{$rawObject->getIndex()}">
        <div class="lu-col-lg-12">
            <div class="alert alert-warning" role="alert">
                <button type="button" class="close" data-dismiss="alert"></button>
                <p>{$customTplVars.warning}</p>
                {if $customTplVars.warningMessage}<p>{$customTplVars.warningMessage}</p>{/if}
            </div>
        </div>
    </div>
</script>