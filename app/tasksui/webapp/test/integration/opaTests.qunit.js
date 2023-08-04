sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/sap/pm/tasksui/test/integration/FirstJourney',
		'com/sap/pm/tasksui/test/integration/pages/TaskList',
		'com/sap/pm/tasksui/test/integration/pages/TaskObjectPage'
    ],
    function(JourneyRunner, opaJourney, TaskList, TaskObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/sap/pm/tasksui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTaskList: TaskList,
					onTheTaskObjectPage: TaskObjectPage
                }
            },
            opaJourney.run
        );
    }
);