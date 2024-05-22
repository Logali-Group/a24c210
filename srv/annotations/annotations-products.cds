using {ProductService as call} from '../service';

using from './annotations-suppliers';
using from './annotations-details';
using from './annotations-reviews';
using from './annotations-inventory';


annotate call.ProductsSet with @odata.draft.enabled;

annotate call.ProductsSet with {
    Product      @title: 'Product';
    ProductName  @title: 'Product Name';
    Description  @title: 'Description';
    PictureURL   @title: 'Photo';
    Rating       @title: 'Rating';
    Price        @title: 'Price';
    Currency     @title: 'Currency';
    Category     @title: 'Category';
    SubCategory  @title: 'Subcategory'  @Common: {
        Text           : SubCategory.name,
        TextArrangement: #TextOnly,
    };
    Supplier     @title: 'Supplier';
    Statu        @title: 'Availability';
};

annotate call.ProductsSet with {
    PictureURL  @UI.IsImage  @Core.MediaType: 'image/png';
    Category    @Common: {
        Text           : Category.name,
        TextArrangement: #TextOnly,
    };
    SubCategory @Common: {
        Text           : SubCategory.name,
        TextArrangement: #TextOnly,
    };
    Supplier    @Common: {
        Text           : Supplier.SupplierName,
        TextArrangement: #TextOnly,
    };
};

annotate call.ProductsSet with @(
    UI.SelectionFields         : [
        Category_ID,
        SubCategory_ID,
        Supplier_ID,
        Statu_Code
    ],
    UI.HeaderInfo              : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Product',
        TypeNamePlural: 'Products',
        Title         : {
            $Type: 'UI.DataField',
            Value: ProductName,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Product,
        },
    },
    UI.FieldGroup #Photo       : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: PictureURL,
            Label: '',
        }, ],
    },
    UI.FieldGroup #Category    : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Category_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: SubCategory_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: Supplier_ID,
            },
        ],
    },
    UI.FieldGroup #Description : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: Description,
            Label: '',
        }, ],
    },
    UI.FieldGroup #Availability: {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type      : 'UI.DataField',
            Value      : Statu_Code,
            Criticality: Criticality,
            Label      : '',
        }, ],
    },
    UI.FieldGroup #Price       : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: Price,
            Label: '',
        }, ],
    },
    UI.HeaderFacets            : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Photo',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Category',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Description',
            Label : 'Product Description'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Availability',
            Label : 'Availability'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Price',
            Label : 'Price'
        }
    ],
    UI.LineItem                : [
        {
            $Type: 'UI.DataField',
            Value: PictureURL,
        },
        {
            $Type: 'UI.DataField',
            Value: ProductName,
        },
        {
            $Type: 'UI.DataField',
            Value: Category_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: SubCategory_ID,
        },
        {
            $Type      : 'UI.DataField',
            Value      : Statu_Code,
            Criticality: Criticality,
        },
        {
            $Type                : 'UI.DataFieldForAnnotation',
            Target               : '@UI.DataPoint#Rating',
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '120px',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: Price,
        },
    ],
    UI.DataPoint #Rating       : {
        $Type        : 'UI.DataPointType',
        Value        : Rating,
        Visualization: #Rating,
    },
    UI.Facets                  : [
        {
            $Type : 'UI.CollectionFacet',
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    Facets: [
                        {
                            $Type : 'UI.ReferenceFacet',
                            Target: 'Supplier/@UI.FieldGroup#Supplier',
                            Label : 'Information',
                        },
                        {
                            $Type : 'UI.ReferenceFacet',
                            Target: 'Supplier/Contact/@UI.FieldGroup#Contact',
                            Label : 'Contact Person',
                        },
                    ],
                    Label : 'Supplier Information',
                },
            ],
        }, 
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'ToDetails/@UI.LineItem#Details',
            Label : 'Product Information',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'ToReviews/@UI.LineItem#Reviews',
            Label : 'Reviews',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'ToInventory/@UI.LineItem',
            Label : 'Stock Data',
        },
    ],
);
