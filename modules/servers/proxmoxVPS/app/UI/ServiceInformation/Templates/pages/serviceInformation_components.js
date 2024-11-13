mgJsComponentHandler.addDefaultComponent('mg-serviceInformationDataTable', {
    template: '#t-mg-serviceInformationDataTable',
    props: [
        'component_id',
        'component_namespace',
        'component_index'
    ],
    data: function () {
        return {
            data: {},
            loading_state: false,
            passwordShow: false,

        };
    },
    created: function () {
        var self = this;
        self.$nextTick(function () {
            self.loadAjaxDataRecurring();
        });
        self.$parent.$root.$on('reloadMgData', this.updateMgData);
    },
    methods: {
        loadAjaxDataRecurring: function(){
            var self = this;
            self.loadAjaxData();
            setTimeout(function () {
                self.loadAjaxDataRecurring();
            }, 60000);
        },
        loadAjaxData: function () {
            var self = this;
            self.loading_state = true;

            var requestParams = {
                loadData: self.component_id,
                namespace: self.component_namespace,
                index: self.component_index
            };

            var response = mgPageControler.vueLoader.vloadData(requestParams);
            return response.done(function (data) {
                self.data = data.data.rawData.data;
                self.loading_state = false;
            }).fail(function () {
                self.loading_state = false;
            });
        },
        loadModal: function (event, targetId, namespace, index, params, addSpinner) {
            mgPageControler.vueLoader.loadModal(event, targetId,
                typeof namespace !== 'undefined' ? namespace : getItemNamespace(targetId),
                typeof index !== 'undefined' ? index : getItemIndex(targetId), params, addSpinner);
        },
        updateMgData: function(toReloadId){
            if(this.component_id === toReloadId)
            {
                this.loadAjaxData();
            }
        }
    }
});
