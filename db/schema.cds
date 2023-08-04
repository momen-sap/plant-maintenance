namespace com.sap.pm;

using {managed} from '@sap/cds/common';

// Hedaer Parent Entity
entity WorkOrder : managed {
  key ID          : UUID @(Core.Computed: true);
      description : String;
      owner       : String;
      timeline    : String;
      tasks       : Association to many Task
                      on tasks.workorder = $self;
}

// Line item Child Entity
entity Task : managed {
  key ID          : UUID @(Core.Computed: true);
      title       : String(100);
      prio        : String(5);
      descr       : String;
      workorder : Association to WorkOrder;
      impact      : Integer;
      criticality : Integer;
}
