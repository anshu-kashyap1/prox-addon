<script type="text/x-template" id="t-mg-details-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="lu-row lu-row--eq-height">
        <div class="lu-col-lg-12">
            <div class="lu-widget">
                <div class="lu-widget__header">
                    <div class="lu-widget__top lu-top">
                        <div class="lu-top__title">{$MGLANG->absoluteT('Summary')} {{  data.node }}</div>
                    </div>
                </div>
                <div class="lu-widget__body">
                    <div class="lu-widget__content" v-if="data.status">
                        <ul class="lu-list lu-list--info">
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('Uptime')}</span>
                                <span class="lu-list__value">{literal}{{ data.status.uptime }}{/literal}</span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('Load Average')}</span>
                                <span class="lu-list__value">{literal} {{ data.status.loadavg[0] }}, {{  data.status.loadavg[1]  }}, {{  data.status.loadavg[2]  }} {/literal}</span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('CPUs')}</span>
                                <span class="lu-list__value"
                                      v-if="data.status.cpuinfo.sockets > 1">{{ data.status.cpuinfo.cpus }}
                                 x {{ data.status.cpuinfo.model }} {{ data.status.cpuinfo.sockets }} {$MGLANG->T('sockets')}
                                </span>
                                <span class="lu-list__value" v-else> {{ data.status.cpuinfo.cpus }}
                                 x {{ data.status.cpuinfo.model }} {{ data.status.cpuinfo.sockets }} {$MGLANG->T('socket')}
                                </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('CPUs Usage')}</span>
                                <span class="lu-list__value"> {{ data.status.cpu }} </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('IO Delay')}</span>
                                <span class="lu-list__value"> {{ data.status.idle }} % </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">
                                    {$MGLANG->T('RAM Usage')}

                                </span>
                                <span class="lu-list__value">

                                     <div class="progress" style="margin-bottom:0px; margin-right: 5px; width: 50%;">
                                        <div class="progress-bar progress-bar-success"
                                             role="progressbar" {literal} :aria-valuenow=" data.status.memory.percent " {/literal}
                                             aria-valuemin="1" aria-valuemax="100"
                                       {literal} :style=" { width: data.status.memory.percent + '%' }" {/literal}    >
                                            {{ data.status.memory.percent }}%
                                        </div>
                                    </div>
                                    {{ data.status.memory.used }} / {{ data.status.memory.total }}
                                </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('SWAP Usage')}
                                </span>
                                <span class="lu-list__value">
                                    <div class="progress" style="margin-bottom:0px; margin-right: 5px; width: 50%;">
                                        <div class="progress-bar progress-bar-success"
                                             role="progressbar" {literal} :aria-valuenow=" data.status.swap.percent " {/literal}
                                             aria-valuemin="1" aria-valuemax="100"
                                       {literal} :style=" { width: data.status.swap.percent + '%' }" {/literal}    >
                                            {{ data.status.swap.percent }}%
                                        </div>
                                    </div>
                                     {{ data.status.swap.used }} / {{ data.status.swap.total }}
                                </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('HD Space (root)')}
                                </span>
                                <span class="lu-list__value">
                                    <div class="progress" style="margin-bottom:0px; margin-right: 5px; width: 50%;">
                                        <div class="progress-bar progress-bar-success"
                                             role="progressbar" {literal} :aria-valuenow=" data.status.rootfs.percent " {/literal}
                                             aria-valuemin="1" aria-valuemax="100"
                                       {literal} :style=" { width: data.status.rootfs.percent + '%' }" {/literal}    >
                                            {{ data.status.rootfs.percent }}%
                                        </div>
                                    </div>
                                    {{ data.status.rootfs.used }} / {{ data.status.rootfs.total }}
                                </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('KSM Sharing')}</span>
                                <span class="lu-list__value"> {{ data.status.ksm.shared }} </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('PVE Manager Version')}</span>
                                <span class="lu-list__value"> {{ data.status.pveversion }} </span>
                            </li>
                            <li class="lu-list__item">
                                <span class="lu-list__item-title">{$MGLANG->T('Kernel Version')}</span>
                                <span class="lu-list__value"> {{ data.status.kversion }} </span>
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
