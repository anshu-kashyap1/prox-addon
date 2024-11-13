<script type="text/x-template" id="t-mg-subscription-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="lu-row lu-row--eq-height">
        <div class="lu-col-lg-12">
            <div class="lu-widget">
                <div class="lu-widget__header">
                    <div class="lu-widget__top lu-top">
                        <div class="lu-top__title">{$MGLANG->absoluteT('Subscription')} </div>
                    </div>
                </div>
                <div class="lu-widget__body">
                    <div class="lu-widget__content" v-if="data.subscription">
                        <ul class="lu-list lu-list--info">
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('Status')}</span>
                                <span class="lu-list__value"> {{ data.subscription.message }} </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('Server ID')}</span>
                                <span class="lu-list__value"> {{ data.subscription.serverid }}</span>
                            </li>
                        </ul>
                    </div>
                    <div v-else style="padding: 15px; text-align: center; border-top: 1px solid #e9ebf0;">
                        {$MGLANG->absoluteT('noDataAvalible')}
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
