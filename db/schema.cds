namespace com.logaligroup;

using {
        cuid,
        managed,
        sap.common.CodeList
} from '@sap/cds/common';

type decimal : Decimal(4, 2);

entity Products : cuid, managed {
        Product     : String(100);
        Description : String(255);
        PictureURL  : String;
        Rating      : Decimal(2, 2);
        Price       : Decimal(10, 2);
        Currency    : String;
        Category    : Association to VH_Categories; // Almacena el ID de la categoria
        SubCategory : Association to VH_Subcategories; //Almacena el ID de la subcategoria
        Supplier    : Association to Suppliers; // Almacena el ID del proveedor
        Statu       : Association to VH_Status; //Almacena el Code del statu
        ToDetails   : Composition of many Details
                              on ToDetails.Product = $self;
};

entity Details : cuid {
        Height       : decimal;
        Width        : decimal;
        Depth        : decimal;
        Weight       : decimal;
        UnitMeasure1 : String;
        UnitMeasure2 : String;
        BaseUnit     : String;
        Product      : Association to Products; // Almacena el ID del producto
};

entity Suppliers : cuid {
        SupplierName : String;
        WebAddress   : String;
        Contact      : Association to Contacts; //Almacena el ID de Contacto
};

entity Contacts : cuid {
        FullName    : String;
        Email       : String;
        PhoneNumber : String;
};

entity VH_Categories : cuid, CodeList {
        ToSubcategories : Composition of many VH_Subcategories
                                  on ToSubcategories.Category = $self;
};

entity VH_Subcategories : cuid, CodeList {
        Category : Association to VH_Categories; // Almacena el ID de la categoria
};

entity VH_Status : CodeList {
        key Code : String enum {
                    InStock        = 'In Stock';
                    NotInStock     = 'Not In Stock';
                    LowAvalibility = 'Low Avalibility';
            };
};
