<script type="text/x-template" id="t-mg-serviceInformationDataTable-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="lu-row lu-row--eq-height {$rawObject->getClasses()}" id="{$rawObject->getId()}" namespace="{$namespace}"
         index="{$rawObject->getIndex()}" actionid="{$rawObject->getIndex()}">
        <div class="lu-col-lg-12">
            <div class="lu-widget">
                <div class="lu-widget__header" style="border-bottom: none;">
                    <div class="lu-widget__top lu-top">
                        <div class="lu-top__title">
                            {$MGLANG->absoluteT($title)}
                        </div>
                        {if $rawObject->hasButtons()}
                            <div class="lu-top__toolbar">
                                {$rawObject->insertButton('updateeButton')}
                            </div>
                        {/if}
                    </div>
                </div>
                <div class="lu-widget__body">
                    <div class="no-footer">
                        <div>
                            <table role="grid" class="lu-table lu-table--mob-collapsible no-footer dtr-column"
                                   width="100%" v-if="data.status">
                                <tbody>
                                <tr v-if="data.status.status">
                                    <td>{$MGLANG->tr('Status')}</td>
                                    <td v-html="data.status.status"></td>
                                </tr>
                                <tr v-if="data.node">
                                    <td>{$MGLANG->tr('Node')}</td>
                                    <td>{literal}{{ data.node  }}{/literal}</td>
                                </tr>
                                <tr v-if="data.config.name">
                                    <td>{$MGLANG->tr('Hostname')}</td>
                                    <td>
                                        <span>{literal}{{ data.config.name  }} {/literal} </span>
                                    </td>
                                </tr>
                                <tr v-if="data.status.uptime">
                                    <td>{$MGLANG->tr('Uptime')}</td>
                                    <td>
                                        {literal} {{ data.status.uptime }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.status.cpu">
                                    <td>{$MGLANG->tr('CPU Usage')}</td>
                                    <td>
                                        {literal}  {{ data.status.cpu }} {/literal} % {$MGLANG->tr('of')} {literal} {{ data.status.cpus }} {/literal}
                                         {$MGLANG->tr('Cores')}
                                        <span v-if="data.status.cpuunit"> {$MGLANG->tr('CPU Units')}  {literal} {{ data.status.cpuunit }}{/literal}</span>
                                    </td>
                                </tr>
                                <tr v-if="data.status.mem">
                                    <td>{$MGLANG->tr('Memory')}</td>
                                    <td v-if="data.virtualization == 'qemu' && data.status.balloon_min">
                                        {$MGLANG->tr('Total')}: {literal}{{ data.status.maxmem }}{/literal}
                                        {$MGLANG->tr('Usage')}: {literal}{{ data.status.mem }}{/literal}
                                    </td>
                                    <td v-else>
                                        {literal}  {{ data.status.mem  }} / {{ data.status.maxmem }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.virtualization == 'lxc' && data.status.swap">
                                    <td>{$MGLANG->tr('SWAP')}</td>
                                    <td>
                                        {literal}   {{ data.status.swap  }} / {{ data.status.maxswap }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.virtualization == 'lxc' && data.status.disk">
                                    <td>{$MGLANG->tr('Boot Disk')}</td>
                                    <td>
                                        {literal}    {{ data.status.disk  }} / {{ data.status.maxdisk }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.backupsFilesLimit">
                                    <td>{$MGLANG->tr('Backups Files Limit')}</td>
                                    <td>
                                        {literal}      {{ data.backupsFilesLimit }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.networkRate">
                                    <td>{$MGLANG->tr('Network Rate')}</td>
                                    <td v-if="data.networkRate">
                                        {literal}        {{ data.networkRate }} {/literal}
                                    </td>
                                    <td v-else>
                                        {$MGLANG->tr('Unlimited')}
                                    </td>
                                </tr>
                                <tr v-if="data.ipAddresses">
                                    <td>{$MGLANG->tr('IP Addresses')}</td>
                                    <td>
                                        {literal}    {{ data.ipAddresses }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.cdrom">
                                    <td>{$MGLANG->tr('CD/DVD Disc Image File')}</td>
                                    <td>
                                        <span>{literal} {{ data.cdrom.iso }}  {/literal} </span>
                                    </td>
                                </tr>
                                <tr v-if="data.bootOrder">
                                    <td>{$MGLANG->tr('Boot Order')}</td>
                                    <td>
                                        <span>{literal} {{ data.bootOrder }}  {/literal} </span>
                                    </td>
                                </tr>
                                <tr v-if="data.sshkeysName">
                                    <td>{$MGLANG->tr('SSH Public Key')}</td>
                                    <td>
                                        <span>{literal} {{ data.sshkeysName }}  {/literal} </span>
                                    </td>
                                </tr>
                                <tr v-if="data.keyPairs && data.keyPairs.public">
                                    <td>{$MGLANG->tr('SSH Public Key')}</td>
                                    <td>
                                        {$rawObject->insertButton('sshPublicKeyDownloadButton')}
                                    </td>
                                </tr>
                                <tr v-if="data.keyPairs && data.keyPairs.private">
                                    <td>{$MGLANG->tr('SSH Private Key')}</td>
                                    <td>
                                        {$rawObject->insertButton('sshPrivateKeyDownloadButton')}
                                    </td>
                                </tr>
                                <tr v-if="data.osinfo">
                                    <td>{$MGLANG->tr('OS Info')}</td>
                                    <td>
                                        {literal}     {{ data.osinfo.name }} {{ data.osinfo.version }} {{ data.osinfo.machine }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.quemuAgent">
                                    <td>{$MGLANG->tr('Quemu Agent')}</td>
                                    <td style="color: red">
                                        {literal}  {{ data.quemuAgent }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.osinfo">
                                    <td>{$MGLANG->tr('Kernel Release')}</td>
                                    <td>
                                        {literal}    {{ data.osinfo.kernelrelease }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.hostname">
                                    <td>{$MGLANG->tr('Hostname')}</td>
                                    <td>
                                        {literal}   {{ data.hostname }} {/literal}
                                    </td>
                                </tr>
                                <tr v-if="data.diskUsage">
                                    <td>{$MGLANG->tr('Disk Usage')}</td>
                                    <td v-html="data.diskUsage"></td>
                                </tr>
                                <tr v-if="data.bwUsage">
                                    <td>{$MGLANG->tr('Bandwidth Usage')}</td>
                                    <td v-html="data.bwUsage"></td>
                                </tr>
                                <tr v-if="data.features">
                                    <td>{$MGLANG->tr('Features')}</td>
                                    <td>
                                        {{ data.features }}
                                    </td>
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
