using {ProductService as call} from '../service';

annotate call.DetailsSet with {
    BaseUnit     @title: 'Base Unit';
    Depth        @title: 'Depth';
    Height       @title: 'Height';
    Width        @title: 'Width';
    Weight       @title: 'Weight';
    UnitMeasure1 @title: 'Volume Unit';
    UnitMeasure2 @title: 'Weight Unit';
    Product @Common: {
        Text : Product.ProductName,
        TextArrangement : #TextOnly,
    }
};

annotate call.DetailsSet with @(
    UI.HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Detail',
        TypeNamePlural : 'Details',
        Title : {
            $Type : 'UI.DataField',
            Value : Product_ID,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : Product.Product,
        },
    },
    UI.LineItem #Details : [
        {
            $Type : 'UI.DataField',
            Value : Height,
        },
        {
            $Type : 'UI.DataField',
            Value : Width,
        },
        {
            $Type : 'UI.DataField',
            Value : Depth,
        },
        {
            $Type : 'UI.DataField',
            Value : Weight,
        },
    ],
    UI.FieldGroup #Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BaseUnit,
            },
            {
                $Type : 'UI.DataField',
                Value : Height,
            },
            {
                $Type : 'UI.DataField',
                Value : Width,
            },
            {
                $Type : 'UI.DataField',
                Value : Depth,
            },
            {
                $Type : 'UI.DataField',
                Value : Weight,
            },
        ],
    },
    UI.Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Details',
            Label : 'Details',
        },
    ],
);

