using {ProductService as call} from '../service';

annotate call.VH_DepartmentsSet with {
    ID @title: 'Department' @Common:{
        Text : name,
        TextArrangement : #TextOnly,
    }
};
