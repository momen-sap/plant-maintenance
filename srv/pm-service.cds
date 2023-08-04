using {com.sap.pm as models} from '../db/schema';

@path: 'service/pm'

service PMService {
  entity WorkOrder as projection on models.WorkOrder;
  annotate WorkOrder with @odata.draft.enabled;
  entity Task      as projection on models.Task;
  annotate Task with @odata.draft.enabled;
}
