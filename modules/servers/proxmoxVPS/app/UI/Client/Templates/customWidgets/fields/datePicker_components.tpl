<script type="text/x-template" id="t-mg-date-picker-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
        :predefined_date="predefined_date"
        :date_format="date_format"
>
    <vuejs-datepicker
            placeholder="{$rawObject->getPlaceholder()}"
            name="{$rawObject->getName()}"
            calendar-class="lu-data-picker display-up"
            input-class="lu-form-control"
            :value="date"
            :format="customFormatter"
            clear-button="true"
            clear-button-icon="lu-zmdi lu-i-c-2x lu-zmdi-close"
            {if $rawObject->isDisabled()}disabled='disabled'{/if}
    {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach}
    />

</script>
