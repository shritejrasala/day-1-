sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'bussinesspartner/test/integration/FirstJourney',
		'bussinesspartner/test/integration/pages/Bussiness_PartnerList',
		'bussinesspartner/test/integration/pages/Bussiness_PartnerObjectPage'
    ],
    function(JourneyRunner, opaJourney, Bussiness_PartnerList, Bussiness_PartnerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('bussinesspartner') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBussiness_PartnerList: Bussiness_PartnerList,
					onTheBussiness_PartnerObjectPage: Bussiness_PartnerObjectPage
                }
            },
            opaJourney.run
        );
    }
);