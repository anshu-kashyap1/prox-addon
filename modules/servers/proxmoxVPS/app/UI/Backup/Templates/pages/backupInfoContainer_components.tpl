<script type="text/x-template" id="t-mg-backupInfoContainer-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="lu-row">
        <div class="lu-col-md-12 {$rawObject->getClasses()}" id="{$rawObject->getId()}" namespace="{$namespace}"
             index="{$rawObject->getIndex()}">
            <div class="alert alert-info">
                <span>{$rawObject->getMessage()}</span>
            </div>
        </div>
    </div>
</script>