sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'bussinesspartner',
            componentId: 'Bussiness_PartnerObjectPage',
            contextPath: '/Bussiness_Partner'
        },
        CustomPageDefinitions
    );
});