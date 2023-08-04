sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.sap.pm.tasksui',
            componentId: 'TaskObjectPage',
            entitySet: 'Task'
        },
        CustomPageDefinitions
    );
});