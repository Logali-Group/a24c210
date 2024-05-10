using {com.logaligroup as call} from '../db/schema';

service ProductService {
    entity ProductsSet         as projection on call.Products;
    entity DetailsSet          as projection on call.Details;
    entity SuppliersSet        as projection on call.Suppliers;
    entity ContactsSet         as projection on call.Contacts;
    entity VH_CategoriesSet    as projection on call.VH_Categories;
    entity VH_SubcategoriesSet as projection on call.VH_Subcategories;
    entity VH_Status           as projection on call.VH_Status;
};
