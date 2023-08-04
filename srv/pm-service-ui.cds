using PMService from './pm-service';


annotate PMService.WorkOrder with {
    ID          @(
        UI.Hidden,
        Common: {Text: description}
    );
    description @title: 'Description';
    owner       @title: 'Owner';
    timeline    @title: 'Timeline';
    tasks       @title: 'Tasks';
}

annotate PMService.Task with {
    title     @title: 'Title';
    prio      @title: 'Priority';
    descr     @title: 'Description';
    workorder @title: 'Work Order';
    impact    @title: 'Impact';
}

annotate PMService.Task with @(UI: {
    HeaderInfo      : {
        TypeName      : 'Task',
        TypeNamePlural: 'Tasks',
        Title         : {
            $Type: 'UI.DataField',
            Value: title
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: descr
        }
    },
    SelectionFields : [prio],
    LineItem        : [
        {Value: title},
        {Value: workorder_ID},
        {
            Value      : prio,
            Criticality: criticality
        },
        {
            Value      : impact,
            Criticality: criticality
        }
    ],
    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target: '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main: {Data: [
        {Value: workorder_ID},
        {
            Value      : prio,
            Criticality: criticality
        },
        {
            Value      : impact,
            Criticality: criticality
        }
    ]}
}, ) {

};

annotate PMService.Task with {
    workorder @(Common: {
        //show text, not id for workorder in the context of tasks
        Text           : workorder.description,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Work Orders',
            CollectionPath: 'WorkOrder',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: workorder_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    });
}
