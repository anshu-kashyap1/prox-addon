mgJsComponentHandler.addDefaultComponent('mg-ajax-select-rs', {
    template : '#t-mg-ajax-select-rs',
    props: [
        'component_id',
        'component_namespace',
        'component_index',
        'reload_fields_ids',
        'hide_by_default_if_no_data',
        'def_opt_key',
        'def_opt_val'
    ],
    data : function() {
        return {
            options: [],
            selected: null,
            selectInstance: null,
        };
    },
    created: function () {
        var self = this;
        self.$nextTick(function() {
           self.initSelect();
        });

        //create reload events
        for (var key in self.reload_fields_ids) {
            if (!self.reload_fields_ids.hasOwnProperty(key)) {
                continue;
            }

            mgEventHandler.on('SelectFieldValueChanged', self.reload_fields_ids[key], function(id, params){
                self.loadAjaxData();
            });
        }
    },
    methods: {
        initSelect: function() {
            var self = this;

            if ($('#' + self.component_id).hasClass('selectized')) {
                var selectizedInstance = $('#' + self.component_id).mgSelectize();
                selectizedInstance[0].selectize.destroy();
            }

            var selSelect = $('#' + self.component_id).mgSelectize({
                valueField: 'key',
                labelField: 'value',
                searchField: 'value',
                plugins: ['remove_button'],
                options: self.options,
                load: function(query, callback) {
                    //if no search string
                    if (!query.length) {
                       // return;
                        return callback([]);
                    } else {
                        var tmpres = self.loadAjaxData(query);
                        tmpres.done(function(data){
                            setTimeout(function (){
                                callback(self.options);
                            },100);
                        });
                    }
                }
            });

            self.selectInstance  = selSelect[0].selectize;

            self.selectInstance .on('change', function(value){
                self.selectChangeAction();
            });

            if (self.def_opt_key && self.def_opt_val) {
                self.selectInstance.addOption({key: self.def_opt_key, value: self.def_opt_val});
                self.selectInstance.addItem(self.def_opt_key, true)
                self.selectInstance.refreshOptions(false);
            }
        },
        loadAjaxData: function(query) {
            var self = this;
            self.loading_state = true;

            var loadFormData = false;
            for (var key in self.reload_fields_ids) {
                if (!self.reload_fields_ids.hasOwnProperty(key)) {
                    continue;
                }
                if (self.reload_fields_ids[key] !== '' && self.reload_fields_ids)
                {
                    loadFormData = true;
                    break;
                }
            }

            if (loadFormData) {
                var tmpForm = $("select[name='" + self.component_id + "']").parents('form').first();
                var tmpFormId = $(tmpForm).attr('id');
                var tmpFormDataHandler = new mgFormControler(tmpFormId);
                var formData = tmpFormDataHandler.getFieldsData();
                if (typeof formData.formData !== 'undefined') {
                    formData = formData.formData;
                }
            } else {
                var formData = {};
            }

            var requestParams = {
                loadData: self.component_id,
                namespace: self.component_namespace,
                index: self.component_index,
                searchQuery: query
            };

            for (var key in formData) {
                if (!formData.hasOwnProperty(key)) {
                    continue;
                }
                requestParams[key] = formData[key];
            }

            var response = mgPageControler.vueLoader.vloadData(requestParams);
            return response.done(function(data){
                self.options = [];
                for (var key in data.data.rawData.options) {
                    if (!data.data.rawData.options.hasOwnProperty(key)) {
                        continue;
                    }

                    var tmpOpt = {};
                    tmpOpt[key] = data.data.rawData.options[key];
                    self.options.push({}[key] = data.data.rawData.options[key]);
                }
                self.$nextTick(function() {
                    self.showSelectIfHidden();
                });
            }).fail(function(){

            });
        },
        showSelectIfHidden : function() {
            var self = this;
            if (self.hide_by_default_if_no_data && self.options.length > 0) {
                if ($('#' + self.component_id).parents('.lu-form-group').first().length > 0) {
                    $('#' + self.component_id).parents('.lu-form-group').first().removeAttr('hidden');
                }
            }
        },
        selectChangeAction : function() {
            mgEventHandler.runCallback('SelectFieldValueChanged', this.component_id, {data: this});
        },
    }
});