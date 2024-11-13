mgJsComponentHandler.addDefaultComponent('mg-vpsBuild', {
    template: '#t-mg-vpsBuild',
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
            self.loadAjaxData();
        });
        self.$parent.$root.$on('reloadMgData', this.updateMgData);
        /*reload each 30 sec*/
        setInterval(function(){
            mgPageControler.vueLoader.refreshingState = ['vpsBuild'];
            mgPageControler.vueLoader.runRefreshActions();
        }, 1000*30);

    },
    methods: {
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
        updateMgData: function(toReloadId){
            if(this.component_id === toReloadId)
            {
                this.loadAjaxData();
            }
        }
    }
});
