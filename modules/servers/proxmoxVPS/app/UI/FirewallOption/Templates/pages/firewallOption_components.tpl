<script type="text/x-template" id="t-mg-firewallOption-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="lu-row lu-row--eq-height" id="{$rawObject->getId()}" namespace="{$namespace}"
         index="{$rawObject->getIndex()}" actionid="{$rawObject->getIndex()}">
        <div class="lu-col-lg-12">
            <div class="lu-widget">
                <div class="lu-widget__header" style="border-bottom: none;">
                    <div class="lu-widget__top lu-top">
                        <div class="lu-top__title">
                            {$MGLANG->absoluteT($title)}
                        </div>

                        <div class="lu-top__toolbar">
                            {foreach from=$rawObject->getButtons() key=buttonKey item=buttonValue}
                                {$buttonValue->getHtml()}
                            {/foreach}
                        </div>
                    </div>
                </div>
                <div class="lu-widget__body">
                    <div class="no-footer">
                        <div>
                            <table role="grid" class="lu-table lu-table--mob-collapsible no-footer dtr-column"
                                   width="100%" v-if="data.enteries">
                                <tbody>
                                <tr v-for="(value, key) in data.enteries">
                                    <td>{{ key }}</td>
                                    <td v-html="value"></td>
                                </tr>
                                </tbody>
                            </table>
                            <div v-else style="padding: 15px; text-align: center; border-top: 1px solid #e9ebf0;">
                                {$MGLANG->absoluteT('noDataAvalible')}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="lu-preloader-container lu-preloader-container--full-screen lu-preloader-container--overlay"
                     v-show="loading_state">
                    <div class="lu-preloader lu-preloader--sm"></div>
                </div>
            </div>
        </div>
    </div>
</script>
