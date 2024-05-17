using {ProductService as call} from '../service';
using from './annotaions-contacts';

annotate call.SuppliersSet with {
    Supplier     @title: 'Supplier';
    SupplierName @title: 'Supplier Name';
    WebAddress   @title: 'Web Address';
};

annotate call.SuppliersSet with @(
    UI.FieldGroup #Supplier : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Supplier,
            },
            {
                $Type : 'UI.DataField',
                Value : SupplierName,
            },
            {
                $Type : 'UI.DataField',
                Value : WebAddress,
            },
        ],
    },
);

