using {ProductService as call} from '../service';

annotate call.VH_Status with {
    Code @title: 'Statu' @Common:{
        Text : name,
        TextArrangement : #TextOnly,
    }
};
