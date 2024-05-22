using {com.logaligroup as call} from '../db/schema';

service ProductService {
    entity ProductsSet         as projection on call.Products;
    entity DetailsSet          as projection on call.Details;
    entity SuppliersSet        as projection on call.Suppliers;
    entity ContactsSet         as projection on call.Contacts;
    entity ReviewsSet          as projection on call.Reviews;
    entity InventorySet        as projection on call.Inventory;
    entity VH_CategoriesSet    as projection on call.VH_Categories;
    entity VH_SubcategoriesSet as projection on call.VH_Subcategories;
    entity VH_Status           as projection on call.VH_Status;
    entity VH_DepartmentsSet   as projection on call.VH_Departments;
};
