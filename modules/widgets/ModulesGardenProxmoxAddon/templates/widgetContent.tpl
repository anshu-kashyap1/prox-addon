<div>
    {if $showFaultyVmDeployments}
        <div class="h4">Faulty VM Deployments</div>
        <div>
            <table class="table table-condensed table-striped">
                <thead>
                <tr>
                    <th>Domain</th>
                    <th>VM ID</th>
                    <th>Task</th>
                    <th>Message</th>
                </tr>
                </thead>
                <tbody>
                {if $faultyVmDeployments}
                    {$faultyVmDeployments}
                {else}
                    <tr><td class="text-center" colspan="4">{$MGLANG["norecordsfound"]}</td></tr>
                {/if}
                </tbody>
            </table>
        </div>
    {/if}
    {if $showFailedTasks}
        <div class="h4">Failed Tasks</div>
        <div>
            <table class="table table-condensed table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer</th>
                    <th>Task</th>
                    <th>Message</th>
                </tr>
                </thead>
                <tbody>
                {if $failedTasks}
                    {$failedTasks}
                {else}
                    <tr><td class="text-center" colspan="4">{$MGLANG["norecordsfound"]}</td></tr>
                {/if}
                </tbody>
            </table>
        </div>
    {/if}
    {if $showRemainingResources}
        <div class="h4">Cluster Remaining Resources</div>
        <div>
            <table class="table table-condensed table-striped">
                <thead>
                <tr>
                    <th>Server</th>
                    <th>VMs</th>
                    <th>IPv4</th>
                    <th>IPv6</th>
                    <th>IPv6 Subnet</th>
                </tr>
                </thead>
                <tbody>
                {if $remainingResources}
                    {$remainingResources}
                {else}
                    <tr><td class="text-center" colspan="5">{$MGLANG["norecordsfound"]}</td></tr>
                {/if}
                </tbody>
            </table>
        </div>
    {/if}
    {if $showNodeResources}
        <div class="h4">Node Resources</div>
        <div>
            <table class="table table-condensed table-striped">
                <thead>
                <tr>
                    <th>Server</th>
                    <th>Node</th>
                    <th>VMs Limit</th>
                </tr>
                </thead>
                <tbody>
                {if $nodeResources}
                    {$nodeResources}
                {else}
                    <tr><td class="text-center" colspan="4">{$MGLANG["norecordsfound"]}</td></tr>
                {/if}
                </tbody>
            </table>
        </div>
    {/if}
</div>