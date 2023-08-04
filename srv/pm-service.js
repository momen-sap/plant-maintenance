
const cds = require('@sap/cds')

/**
 * Implementation for PM service defined in ./pmservice.cds
 */
module.exports = cds.service.impl(async function () {

    this.after('READ', 'Task', Result => {

        const tasks = Array.isArray(Result) ? Result : [Result];

        tasks.forEach(task => {
            if (task.impact >= 100000) {
                task.criticality = 1;
            } else {
                task.criticality = 2;
            }
        });

    });

});