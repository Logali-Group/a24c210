namespace com.logaligroup;

using {
        cuid,
        managed,
        sap.common.CodeList
} from '@sap/cds/common';

type decimal : Decimal(4, 2);

entity Products : cuid, managed {
        Product     : String(7);
        ProductName : String(100);
        Description : String(255);
        PictureURL  : String;
        Rating      : Decimal(2, 2);
        Criticality : Int16;
        Price       : Decimal(10, 2) @Measures.ISOCurrency: Currency;
        Currency    : String         @Common.IsCurrency;
        Category    : Association to VH_Categories; // Almacena el ID de la categoria
        SubCategory : Association to VH_Subcategories; //Almacena el ID de la subcategoria
        Supplier    : Association to Suppliers; // Almacena el ID del proveedor
        Statu       : Association to VH_Status; //Almacena el Code del statu
        ToDetails   : Composition of many Details
                              on ToDetails.Product = $self;
        ToReviews   : Composition of many Reviews
                              on ToReviews.Product = $self;
};

entity Reviews : cuid, managed {
        Rating     : Decimal(2, 2);
        Date       : Date;
        User       : String(40);
        ReviewText : String(255);
        HelpFul    : String;
        Product    : Association to Products; //ID del producto
};

entity Details : cuid {
        Height       : decimal @Measures.Unit: UnitMeasure1; //CM
        Width        : decimal @Measures.Unit: UnitMeasure1; //CM
        Depth        : decimal @Measures.Unit: UnitMeasure1; //CM
        Weight       : decimal @Measures.Unit: UnitMeasure2; //KG
        UnitMeasure1 : String  @Common.IsUnit;
        UnitMeasure2 : String  @Common.IsUnit;
        BaseUnit     : String  @Common.IsUnit;
        Product      : Association to Products; // Almacena el ID del producto
};

entity Suppliers : cuid {
        Supplier     : String(10);
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
