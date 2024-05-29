using {ProductService as call} from '../service';

annotate call.VH_SubcategoriesSet with {
    ID @title: 'Sub-Category' @Common:{
        Text : name,
        TextArrangement : #TextOnly,
    }
};
