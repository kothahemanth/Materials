sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/WeekList',
		'project1/test/integration/pages/WeekObjectPage'
    ],
    function(JourneyRunner, opaJourney, WeekList, WeekObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheWeekList: WeekList,
					onTheWeekObjectPage: WeekObjectPage
                }
            },
            opaJourney.run
        );
    }
);