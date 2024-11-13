{**********************************************************************
* ModuleFramework product developed. (2017-09-05)
* *
*
*  CREATED BY MODULESGARDEN       ->       http://modulesgarden.com
*  CONTACT                        ->       contact@modulesgarden.com
*
*
* This software is furnished under a license and may be used and copied
* only  in  accordance  with  the  terms  of such  license and with the
* inclusion of the above copyright notice.  This software  or any other
* copies thereof may not be provided or otherwise made available to any
* other person.  No title to and  ownership of the  software is  hereby
* transferred.
*
*
**********************************************************************}

{**
* @author Michal Zarow <michal.za@modulesgarden.com>
*}

<div class="lu-d-flex lu-align-items-center">
    <i class="lu-zmdi lu-zmdi-folder" v-if="dataRow.rawType == 'd'"></i>
    <i class="fas fa-cube lu-i-c-3x" style="color: inherit" v-else-if="dataRow.rawType == 'v'"></i>
    <i class="lu-zmdi lu-zmdi-file-text" v-else></i>
    <a {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach}
    class="lu-m-l-1x"
    v-if="dataRow.rawType != 'f'"
    @click="makeCustomAction('restoreFileNextPage', [dataRow.name], $event)"
    v-html="dataRow.name" >
    </a>
    <span {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach}
    v-else
    class="lu-m-l-1x"
    v-html="dataRow.name" >
    </span>
</div>