<script type="text/x-template" id="t-mg-resourcesContainer-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="lu-row">

    <div class="lu-col-md-12 {$rawObject->getClasses()}" id="{$rawObject->getId()}" namespace="{$namespace}"
         index="{$rawObject->getIndex()}" actionid="{$rawObject->getIndex()}">
        <div class="lu-widget">
            <div class="lu-widget__header">
                <div class="lu-widget__top lu-top">
                    <div class="lu-top__title">
                        <span>{$MGLANG->absoluteT('serverCA' ,'availableResources')}</span>
                    </div>
                </div>
            </div>
            <div class="lu-widget__body">
                <div class="lu-widget__content">
                    <div class="lu-progress lu-progress--h lu-progress--s lu-progress__label" v-for="(bar, key) in data">
                        <div class="lu-progress__label" style="flex-basis: 28%">
                            {{ bar.name }} {{ bar.used }} / {{ bar.total }} <span v-if="bar.unit"> {{ bar.unit }}  </span>
                            <i v-if="bar.tip" :data-title="bar.tip" data-toggle="lu-tooltip" class="progress-tooltip lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper"></i>
                        </div>
                        <div class="lu-progress__bar progress-bar-danger">
                            <div class="lu-progress__fill"  :style=widthPercent(bar.percent)></div>
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
