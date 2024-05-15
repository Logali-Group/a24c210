using {ProductService as call} from '../service';

annotate call.ProductsSet with {
    Product     @title: 'Product';
    Description @title: 'Description';
    PictureURL  @title: 'Photo';
    Rating      @title: 'Rating';
    Price       @title: 'Price';
    Currency    @title: 'Currency';
    Category    @title: 'Category';
    SubCategory @title: 'Subcategory' @Common:{
        Text : SubCategory.name,
        TextArrangement : #TextOnly,
    };
    Supplier    @title: 'Supplier';
    Statu       @title: 'Availability';
};

annotate call.ProductsSet with {
    PictureURL @UI.IsImageURL @Core.MediaType: 'image/png';
    Category @Common:{
        Text : Category.name,
        TextArrangement : #TextOnly,
    };
    SubCategory @Common:{
        Text : SubCategory.name,
        TextArrangement : #TextOnly,
    };
};

annotate call.ProductsSet with @(
    UI.SelectionFields  : [
        Category_ID,
        SubCategory_ID,
        Supplier_ID,
        Statu_Code
    ],
    UI.LineItem  : [
        {
            $Type : 'UI.DataField',
            Value : PictureURL,
        },
        {
            $Type : 'UI.DataField',
            Value : Product,
        },
        {
            $Type : 'UI.DataField',
            Value : Category_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : SubCategory_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : Statu_Code,
            Criticality : Criticality,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#Rating',
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '120px',
            },
        },
        {
            $Type : 'UI.DataField',
            Value : Price,
        },
    ],
    UI.DataPoint #Rating : {
        $Type : 'UI.DataPointType',
        Value : Rating,
        Visualization : #Rating,
    },
);

