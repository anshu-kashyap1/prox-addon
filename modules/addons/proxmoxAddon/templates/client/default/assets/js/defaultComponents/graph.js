mgJsComponentHandler.addDefaultComponent('mg-graph', {
    template: '#t-mg-graph',
    props: [
        'component_id',
        'component_namespace',
        'component_index'
    ],
    data: function () {
        return {
            loading: false,
            chart: null,
            type: '',
            isRestart: false,
            data: {},
            parseData: "{}",
            options: {},
            filter: {},
            parseFilter: "{}",
        };
    },
    created: function () {
        var self = this;
        self.updateProjects();
        self.$parent.$root.$on('reloadMgData', self.updateMgData);
    },
    mounted: function () {
        var self = this;
    },
    methods: {
        updateMgData: function (toReloadId) {
            var self = this;
            if (("graph_" + self.component_id) === toReloadId) {
                self.updateProjects();
                self.$nextTick(function () {
                    self.$emit('restartRefreshingState');
                });
            }
        },
        createChart: function () {
            var self = this;
            if (self.chart == null || self.isRestart === true) {
                self.$nextTick(function () {
                    self.isRestart = false;
                    var ctx = document.getElementById('canv_' + self.component_id);
                    self.fixDataStructure();
                    self.$nextTick(function () {
                        self.chart = new Chart(ctx, {
                            type: self.type,
                            data: {
                                datasets: self.data.datasets,
                            },
                            options: self.options
                        });
                        self.reloadChart();
                    });
                });
            }
        },
        updateProjects: function () {
            var self = this;
            self.loading = true;
            var request = this.$parent.$root.$options.methods.vloadData({loadData: self.component_id, namespace: self.component_namespace, index: self.component_index}, true);
            request.done(function (data)
            {
                data = JSON.parse(data);

                if (data.data && data.data.rawData) {
                    data = data.data.rawData;
                    if (data.type) {
                        self.type = data.type;
                    }
                    if (data.data) {
                        self.parseData = JSON.stringify(data.dataParse);
                        self.data = data.data;
                    }
                    if (data.options) {
                        self.options = data.options;
                    }
                    if (data.filter) {
                        self.filter = data.filter;
                        self.parseFilter = JSON.stringify(data.filter);
                    }
                }
                self.$nextTick(function () {
                    if (!self.chart) {
                        self.createChart();
                    } else {
                        self.reloadChart();
                    }
                    self.loading = false;
                });
            })
                    .fail(function () {});
        },
        reloadChart: function () {
            var self = this;
            if (self.chart)
            {
                self.fixDataStructure();
                self.chart.options = self.options;
                self.chart.data.datasets = self.data.datasets;

                self.chart.update();
            }
        },
        restartChart: function () {
            var self = this;
            self.isRestart = true;
            self.createChart();
        },
        loadModal: function (event, targetId, namespace, index) {
            var self = this;
            var params = [];
            params.push({name: 'customParams', value: self.parseData});
            params.push({name: 'defaultFilter', value: self.parseFilter});
            mgPageControler.vueLoader.loadM2(event, targetId, typeof namespace !== 'undefined' ? namespace : getItemNamespace(targetId), index, params);
        },
        onOffSwitch: function (event, targetId) {
            var switchPostData = $(event.target).is(':checked') ? {'value': 'on'} : {'value': 'off'};
            mgPageControler.vueLoader.ajaxAction(event, targetId, getItemNamespace(targetId), getItemIndex(targetId), switchPostData);
        },
        makeCustomAction: function (functionName, params, event, namespace, index) {
            mgPageControler.vueLoader.makeCustomAction(functionName, params, event, namespace, index);
        },
        redirect: function (event, params) {
            mgPageControler.vueLoader.redirect(event, params);
        },
        fixDataStructure: function () {
            var self = this;

            var varsToBeConverted = ['backgroundColor', 'borderColor', 'data', 'hoverBackgroundColor',
                'hoverBorderColor', 'pointBackgroundColor', 'pointBorderColor', 'pointHoverBackgroundColor', 'pointHoverBorderColor'];

            for (var key in self.data.datasets) {
                if (!self.data.datasets.hasOwnProperty(key)) {
                    continue;
                }

                var tmpObj = self.data.datasets[key];
                for (var convKey in varsToBeConverted)
                {
                    if (typeof tmpObj[varsToBeConverted[convKey]] === 'object')
                    {
                        self.data.datasets[key][varsToBeConverted[convKey]] = Object.values(tmpObj[varsToBeConverted[convKey]]);
                    } else if (typeof tmpObj[varsToBeConverted[convKey]] !== 'undefined') {
                        self.data.datasets[key][varsToBeConverted[convKey]] = tmpObj[varsToBeConverted[convKey]];
                    } else {
                        //do nothing
                    }
                }
            }
            if (typeof self.data.labels !== 'undefined')
            {
                self.options.labels = Object.values(self.data.labels);
            }
            if (typeof self.options.scales !== 'undefined' && typeof self.options.scales.xAxes !== 'undefined')
            {
                self.options.scales.xAxes[0].labels = Object.values(self.data.labels);
            }
        }
    }
});
